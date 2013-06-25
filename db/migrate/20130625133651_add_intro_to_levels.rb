class AddIntroToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :intro, :text
  end
end
