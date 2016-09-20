
# Файл для населения БД начальными данными, чтобы было с чем играться
#
# выполняется в консоли rake db:seed

Question.create(level: 0, text: '2 + 2 = ...', answer1: '4', answer2: '5', answer3: 'точно не известно', answer4: '-1')
Question.create(level: 1, text: 'А?', answer1: 'Б!', answer2: 'чо', answer3: 'хз', answer4: '-1')
Question.create(level: 2, text: 'Семки есть?', answer1: '42', answer2: 'Кепка', answer3: 'хз', answer4: 'Абибас')
Question.create(level: 3, text: 'А если найду?', answer1: '42', answer2: '5', answer3: 'хз', answer4: 'Через плечо')
Question.create(level: 4, text: 'Кодить умеешь?', answer1: '42', answer2: 'Ну так', answer3: 'хщз', answer4: '-рельсы')
Question.create(level: 5, text: 'главная проблема музыки в россии', answer1: '42', answer2: 'ты слушаеш говно!', answer3: 'музыканты', answer4: 'продюсеры')
Question.create(level: 6, text: 'проблема русского кино', answer1: '42', answer2: 'нет сценаристов', answer3: 'бмв', answer4: 'ты смотришь говно')
Question.create(level: 7, text: 'у верблюда два горба, потому что...', answer1: '42', answer2: 'жизнь - борьба', answer3: 'кпсс', answer4: '-1')
Question.create(level: 8, text: 'Хохо парниша?', answer1: '42', answer2: '5', answer3: 'коммунисты козлы', answer4: '-1')
Question.create(level: 9, text: 'две беды', answer1: '42', answer2: 'дороги', answer3: 'дураки', answer4: 'ой')
Question.create(level: 10, text: 'Любовь это ...', answer1: '42', answer2: 'Жовка такая', answer3: 'вотка яяааат!', answer4: '-1')
Question.create(level: 11, text: 'Кто виноват?', answer1: '42', answer2: '5', answer3: 'туман', answer4: 'Того и тапки')
Question.create(level: 12, text: 'Быть или не быть?', answer1: '42', answer2: 'надоел уже', answer3: 'Вася Куролесов', answer4: 'бермуды')
Question.create(level: 13, text: 'Деньги есть?', answer1: 'Денег нет', answer2: 'Но вы держитесь', answer3: 'Хорошего настроения!', answer4: 'Счастья вам!')
Question.create(level: 14, text: 'Почему?', answer1: '42', answer2: '5', answer3: 'точно не известно', answer4: '-1')