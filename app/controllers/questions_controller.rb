# (c) goodprogrammer.ru
#
# Админский контроллер, только для наполнения базы вопросов с помощью файлов
# определенного формата
# Создает новую игру, обновляет статус игры по ответам юзера, выдает подсказки
#
class QuestionsController < ApplicationController
  # проверяем залогинен ли юзер
  before_action :authenticate_user!

  # проверяем админ ли он
  before_action :authorize_admin!

  # GET /questions/new
  # Форма для загрузки пачки вопросов
  def new
  end

  # POST /questions
  # Обработка формы, содержащей файл с вопросами и поле - уровень
  def create
    level = params[:questions_level].to_i
    q_file = params[:questions_file]

    # читаем содержимое файла в массив
    # http://stackoverflow.com/questions/2521053/how-to-read-a-user-uploaded-file-without-saving-it-to-the-database
    if q_file.respond_to?(:readlines)
      file_lines = q_file.readlines
    elsif q_file.respond_to?(:path)
      file_lines = File.readlines(q_file.path)
    else
      # если файл нельзя прочитать, отправляем на экшен new c инфой об ошибках
      redirect_to new_questions_path, alert: "Bad file_data: #{q_file.class.name}, #{q_file.inspect}"
      return false
    end

    start_time = Time.now
    # В одной большой транзакции создаем сразу массив вопросов, считаем неудачные
    failed_count = create_questions_from_lines(file_lines, level)

    # отправляем на страницу new и выводим статистику о проделаных операциях
    redirect_to new_questions_path,
                notice: "Уровень #{level}, обработано #{file_lines.size}," +
                  " создано #{file_lines.size - failed_count}," +
                  " время #{Time.at((Time.now - start_time).to_i).utc.strftime '%S.%L сек'}"
  end


  private

  def authorize_admin!
    redirect_to root_path unless current_user.is_admin
  end

  # Загрузка массива вопросов в базе
  # Для скорости оборачиваем все в одну транзакцию
  # см. https://www.coffeepowered.net/2009/01/23/mass-inserting-data-in-rails-without-killing-your-performance/
  def create_questions_from_lines(lines, level)
    failed = 0
    ActiveRecord::Base.transaction do
      lines.each do |line|
        ar = line.split('|')
        q = Question.create(
          level: level,
          text: ar[0].squish,
          answer1: ar[1].squish,
          answer2: ar[2].squish,
          answer3: ar[3].squish,
          answer4: ar[4].squish
        )
        failed += 1 unless q.valid?
      end
    end

    failed
  end

end
