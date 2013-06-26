class AddDirectionsToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :directions, :text
  end
end
