class Poster < ActiveRecord::Base
	belongs_to :user

	belongs_to :last_edit , :class_name => "User", :foreign_key => "last_edit_id"
end
