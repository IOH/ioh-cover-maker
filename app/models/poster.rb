class Poster < ActiveRecord::Base
	belongs_to :user

	belongs_to :last_edit , :class_name => "User", :foreign_key => "last_edit_id"

	mount_uploader :avatar, ImageUploader
	mount_uploader :background, ImageUploader
	mount_uploader :original_avatar, ImageUploader
	mount_uploader :original_background, ImageUploader
end
