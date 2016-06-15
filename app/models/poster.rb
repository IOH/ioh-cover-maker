class Poster < ActiveRecord::Base
	belongs_to :user

	belongs_to :last_edit , :class_name => "User", :foreign_key => "last_edit_id"

	mount_uploader :avatar, ImageUploader
	mount_uploader :background, ImageUploader
	mount_uploader :original_avatar, ImageUploader
	mount_uploader :original_background, ImageUploader
	mount_uploader :poster, ImageUploader

	before_save :default_setting

	private
	def default_setting
		self.name ||= "莊智超 Chih Chao Chuang"
		self.info_one ||= "學經歷 1"
		self.use_avatar ||= true
  	self.location_white ||= true
  	self.info_one_red ||= true
  	self.info_two_red ||= false
  	self.info_three_red ||= false
  	self.avatar_upload ||= false

  	return true
	end
end
