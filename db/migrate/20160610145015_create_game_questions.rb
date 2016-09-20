#  (c) goodprogrammer.ru
#
# Создаем Игровые вопросы
class CreateGameQuestions < ActiveRecord::Migration
  def change
    create_table :game_questions do |t|
      # Игровой вопрос принадлежит игре и вопросу
      t.references :game, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true, null: false

      # Варианты ответов (распределяются в произвольном порядке при создании)
      t.integer :a
      t.integer :b
      t.integer :c
      t.integer :d

      t.timestamps null: false
    end
  end
end
