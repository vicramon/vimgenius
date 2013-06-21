class CreateUserLessons < ActiveRecord::Migration
  def change
    create_table :user_lessons do |t|
      t.references :user, index: true
      t.references :lesson, index: true
      t.decimal :accuracy
      t.decimal :average_time
      t.boolean :completed, default: false
    end
  end
end
