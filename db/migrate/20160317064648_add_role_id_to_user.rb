class AddRoleIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :role, references: :users, index: true
    add_foreign_key :users, :roles, column: :role_id
  end
end
