class AddLastEditColumn < ActiveRecord::Migration
  def change
  	add_reference :posters, :last_edit, references: :users, index: true
  	add_foreign_key :posters, :users, column: :last_edit_id
  end
end
