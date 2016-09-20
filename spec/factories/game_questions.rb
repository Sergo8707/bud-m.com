
# Объявление фабрики для создания нужных в тестах объектов
# см. другие примеры на
# http://www.rubydoc.info/gems/factory_girl/file/GETTING_STARTED.md

FactoryGirl.define do
  factory :game_question do
    # всегда одинаковое распределение ответов
    a 4
    b 3
    c 2
    d 1

    # Связь с игрой и вопросом.
    # Если при создании game_question не указать явно объекты Игра и Вопрос,
    # наша фабрика сама создаст и пропишет нужные объекты, используя фабрики
    # с именами :game и :question
    association :game
    association :question
  end
end