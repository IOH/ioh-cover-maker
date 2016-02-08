#  @editor arfullight
#  @date   2016/2/8
#  @info   create poster table
class CreatePostersTable < ActiveRecord::Migration
  def change
    create_table :posters do |t|

    	t.references :user, index: true, foreign_key: true
    	t.boolean :use_avatar
    	t.string :name
    	t.string :description
    	t.string :info_one
    	t.boolean :info_one_red
    	t.string :info_two
    	t.boolean :info_two_red
    	t.string :info_three
    	t.boolean :info_three_red
    	t.string :location
    	t.boolean :location_white

    	t.timestamps null: false 

    end
  end
end

