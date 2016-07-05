class AddManyToMany < ActiveRecord::Migration
  def change
  	create_table :live_times_lives do |t|
  		t.belongs_to :live, index: true
      t.belongs_to :live_time, index: true
    end
  end
end
