#  (c) goodprogrammer.ru
#
# Создаем игры
class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      # Связь с пользователями
      t.references :user, index: true, foreign_key: true

      # Информация об игре, время начала и конца, текущий уровень, бабло, проиграна ли
      t.datetime :finished_at
      t.integer :current_level, default: 0, null: false
      t.boolean :is_failed
      t.integer :prize, default: 0,  null: false

      t.timestamps null: false
    end
  end
end
