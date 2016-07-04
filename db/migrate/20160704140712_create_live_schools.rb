class CreateLiveSchools < ActiveRecord::Migration
  def change
    create_table :live_schools do |t|
    	t.string :name

      t.timestamps null: false
    end
  end
end
