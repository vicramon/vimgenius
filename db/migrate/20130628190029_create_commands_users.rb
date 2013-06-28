class CreateCommandsUsers < ActiveRecord::Migration
  def change
    create_table :commands_users do |t|
      t.references :user, index: true
      t.references :command, index: true
    end
  end
end
