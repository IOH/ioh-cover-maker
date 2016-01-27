#  @editor arfullight
#  @date   2016/1/27
#  @info   create users table
class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string :account
    	t.string :hashed_password

    end
  end
end
