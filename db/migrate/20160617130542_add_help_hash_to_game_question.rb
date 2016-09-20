class AddHelpHashToGameQuestion < ActiveRecord::Migration
  def change
    add_column :game_questions, :help_hash, :text
  end
end
