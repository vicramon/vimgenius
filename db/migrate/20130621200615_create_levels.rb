class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.references :lesson, index: true
      t.integer :number
      t.string :name
    end
  end
end
