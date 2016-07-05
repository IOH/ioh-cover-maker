class AddColumnForCarrierwave < ActiveRecord::Migration
  def change
  	add_column :posters, :avatar, :string
  	add_column :posters, :background, :string
  	add_column :posters, :original_avatar, :string
  	add_column :posters, :original_background, :string
  end
end
