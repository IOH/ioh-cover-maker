class CreateLives < ActiveRecord::Migration
  def change
    create_table :lives do |t|
    	t.string :name
    	t.datetime :time

      t.timestamps null: false
    end
  end
end
