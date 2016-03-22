class AddColumnToCheckAvatarUpload < ActiveRecord::Migration
  def change
  	add_column :posters, :avatar_upload, :bool
  end
end
