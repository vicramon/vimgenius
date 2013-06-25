class ChangeTextToNameInCommands < ActiveRecord::Migration
  def change
    rename_column :commands, :text, :name
  end
end
