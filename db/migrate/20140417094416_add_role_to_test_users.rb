class AddRoleToTestUsers < ActiveRecord::Migration
  def change
    add_column :test_users, :role, :string
  end
end
