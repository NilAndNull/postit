class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, default: User::Role::USER
  end
end
