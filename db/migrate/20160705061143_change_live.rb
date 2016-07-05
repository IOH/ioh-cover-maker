class ChangeLive < ActiveRecord::Migration
  def change
  	add_column :lives, :title, :string
  	add_column :lives, :onair, :string
  	remove_column :lives, :time
  end
end
