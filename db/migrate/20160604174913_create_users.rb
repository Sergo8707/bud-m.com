
# Создаем юзеров
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email

      # по умолчанию false, запрещены пустые значения (null)
      t.boolean :is_admin, default: false,  null: false

      # по умолчанию 0, запрещены пустые значения (null)
      t.integer :balance, default: 0,  null: false

      t.timestamps null: false
    end
  end
end
