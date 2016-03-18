class DeleteUselessColumn < ActiveRecord::Migration
  def change
  	remove_column :posters, :avatar_dataUrl
  	remove_column :posters, :background_dataUrl
  	remove_column :posters, :poster_dataUrl
  	remove_column :posters, :original_avatar_dataUrl
  	remove_column :posters, :original_background_dataUrl
  end
end
