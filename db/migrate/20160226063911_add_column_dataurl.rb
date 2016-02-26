class AddColumnDataurl < ActiveRecord::Migration
  def change
  	add_column :posters, :avatar_dataUrl, :string
  	add_column :posters, :background_dataUrl, :string
  	add_column :posters, :poster_dataUrl, :string
  end
end
