class AddColumnDataurl < ActiveRecord::Migration
  def change
  	add_column :posters, :avatar_dataUrl, :text, :limit => 4294967295
  	add_column :posters, :background_dataUrl, :text, :limit => 4294967295
  	add_column :posters, :poster_dataUrl, :text, :limit => 4294967295
  end
end
