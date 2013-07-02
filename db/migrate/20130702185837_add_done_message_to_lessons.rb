class AddDoneMessageToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :done_message, :text
  end
end
