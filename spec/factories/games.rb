# Объявление фабрики для создания нужных в тестах объектов
# см. другие примеры на
# http://www.rubydoc.info/gems/factory_girl/file/GETTING_STARTED.md

FactoryGirl.define do
  factory :game do
    # связь с юзером
    association :user

    #  игра только начата
    finished_at nil
    current_level 0
    is_failed false
    prize 0
    # ! эта фабрика создает объект Game без дочерних игровых вопросов,
    # в такую игру играть нельзя, расширим фабрику дочерней фабрикой!

    # фабрика наследует все поля от фабрики :game
    factory :game_with_questions do
      # коллбэк после :build игры - создаем 15 вопросов
      after(:build) { |game|
        15.times do |i|
          # factory_girl create - дергает соотв. фабрику
          # создаем явно вопрос с нужным уровнем
          q = create(:question, level: i)
          # создаем связанные game_questions с нужной игрой и вопросом
          create(:game_question, game: game, question: q)
        end
      }
    end
  end
end
