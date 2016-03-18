#  @editor arfullight
#  @date   2016/1/27
#  @info   create users table
class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string :account_name
    	t.string :password_digest

    	t.timestamps null: false

    end
  end
end
