class CreateLiveTimes < ActiveRecord::Migration
  def change
    create_table :live_times do |t|
    	t.datetime :start
    	t.datetime :end

      t.timestamps null: false
    end
  end
end
