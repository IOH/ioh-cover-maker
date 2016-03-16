class AddUserNameColumn < ActiveRecord::Migration
  def change
  	add_column :posters, :last_user, :string
  end
end
