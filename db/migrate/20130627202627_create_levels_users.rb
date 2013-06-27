class CreateLevelsUsers < ActiveRecord::Migration
  def change
    create_table :levels_users do |t|
      t.references :user, index: true
      t.references :level, index: true
      t.string :timestamps
    end
  end
end
