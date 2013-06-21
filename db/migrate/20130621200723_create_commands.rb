class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.references :level, index: true
      t.string :text
      t.string :keystroke
    end
  end
end
