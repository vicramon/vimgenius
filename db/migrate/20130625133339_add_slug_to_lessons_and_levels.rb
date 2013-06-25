class AddSlugToLessonsAndLevels < ActiveRecord::Migration
  def change
    add_column :lessons, :slug, :string
    add_column :levels, :slug, :string
  end
end
