class AddReferenceToTime < ActiveRecord::Migration
  def change
  	add_reference :live_times, :live, references: :lives, index: true
  	add_foreign_key :live_times, :lives, column: :live_id
  end
end
