class AddRelationToLive < ActiveRecord::Migration
  def change
  	add_reference :lives, :live_school, index: true, foreign_key: true
  	add_reference :lives, :live_department, index: true, foreign_key: true
  end
end
