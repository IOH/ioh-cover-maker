class AddColumnOriginaldataurl < ActiveRecord::Migration
  def change
  	add_column :posters, :original_avatar_dataUrl, :text, :limit => 4294967295
  	add_column :posters, :original_background_dataUrl, :text, :limit => 4294967295
  end
end
