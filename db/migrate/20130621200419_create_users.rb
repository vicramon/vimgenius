class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :email, :string
      t.column :password_digest, :string
      t.column :remember_token, :string
      t.column :reset_password_token, :string
      t.column :session_token, :string
      t.timestamps
    end
  end
end
