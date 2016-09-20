#  (c) goodprogrammer.ru
#
# Вопрос — основная смысловая единица базы вопросов.
# Из вопросов разных уровней сложности формируются все игры.
class Question < ActiveRecord::Base

  QUESTION_LEVELS = (0..14).freeze

  # у вопроса должен быть уровень сложности
  validates :level, presence: true, inclusion: {in: QUESTION_LEVELS}

  # Текст вопроса (не может быть пустым и не должен повторяться, иначе смысл?)
  validates :text, presence: true, uniqueness: true, allow_blank: false

  # Варианты ответов (в первом всегда храним правильный)
  validates :answer1, :answer2, :answer3, :answer4, presence: true
end
