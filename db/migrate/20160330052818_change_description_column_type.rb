class ChangeDescriptionColumnType < ActiveRecord::Migration
  def change
  	change_column :posters, :description, :text
  end
end
