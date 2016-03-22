class DeleteUselessCollumn < ActiveRecord::Migration
  def change
  	remove_column :users, :password_digest
  	remove_column :users, :user_type
  	remove_column :users, :auth_token
  end
end
