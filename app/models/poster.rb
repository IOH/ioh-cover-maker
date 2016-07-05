class Poster < ActiveRecord::Base
	belongs_to :user

	belongs_to :last_edit , :class_name => "User", :foreign_key => "last_edit_id"

	mount_uploader :avatar, ImageUploader
	mount_uploader :background, ImageUploader
	mount_uploader :original_avatar, ImageUploader
	mount_uploader :original_background, ImageUploader
	mount_uploader :poster, ImageUploader

	before_save :default_setting

	#scopes
	def self.this_week
		where('updated_at >= ?', 7.days.ago)
	end

	def self.a_week_more
		where('updated_at < ?', 7.days.ago)
	end

	def self.like(query)
  	whereSearchTerm  = "name LIKE ?"
		whereSearchTerm += "OR description LIKE ?"
		whereSearchTerm += "OR info_one LIKE ?"
		whereSearchTerm += "OR info_two LIKE ?"
		whereSearchTerm += "OR info_three LIKE ?"

		where(whereSearchTerm, query, query, query, query, query)
	end

	def self.order_and_limit(limit)
		order(updated_at: :desc).limit(limit)
	end

	def self.search(query, limit)
		selectTerm = "id, name, info_one, info_one_red, 
								  info_two, info_two_red, info_three, info_three_red, 
								  updated_at, last_user, avatar_upload, updated_at"

		select(selectTerm).like(query).order_and_limit(limit)
	end

	def self.belongs_to(user_id)
		where('user_id = ?', user_id)
	end

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
