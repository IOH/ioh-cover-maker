#  @editor arfullight
#  @date   2016/1/26
#  @info   create poster table
class CreatePosterTable < ActiveRecord::Migration
  def change
    create_table :posters do |t|

    	t.integer :user_id
    	t.string :backgroung_image_url
    	t.string :avatar_url
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

    end
  end
end
