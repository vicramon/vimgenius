class AddTemporaryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :temporary, :boolean, default: false
  end
end
