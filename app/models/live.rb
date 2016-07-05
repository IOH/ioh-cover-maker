class Live < ActiveRecord::Base
	belongs_to :live_school
	belongs_to :live_department
	has_many :live_times
end
