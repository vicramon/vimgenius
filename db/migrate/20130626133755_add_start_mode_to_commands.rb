class AddStartModeToCommands < ActiveRecord::Migration
  def change
    add_column :commands, :start_mode, :string
  end
end
