class Live < ActiveRecord::Base
	belongs_to :live_school
	belongs_to :live_department
end