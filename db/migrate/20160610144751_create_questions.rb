#  (c) goodprogrammer.ru
#
# Создаем Вопросы
class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      # Уровень сложности вопроса (0..14)
      t.integer :level, null: false

      # Текст вопроса (не может быть пустым)
      t.text :text, null: false

      # Варианты ответов (в первом всегда храним правильные, не может быть пустым)
      t.string :answer1, null: false
      t.string :answer2
      t.string :answer3
      t.string :answer4

      t.timestamps null: false
    end

    # Добавляем в БД индекс по полю level - это ускоряет все запросы
    # в базу, где идет выборка по заданному уровню
    add_index :questions, :level
  end
end
