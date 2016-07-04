class CreateLiveDepartments < ActiveRecord::Migration
  def change
    create_table :live_departments do |t|
    	t.string :name
    	t.integer :group

      t.timestamps null: false
    end
  end
end
