class Live < ActiveRecord::Base
	belongs_to :live_school
	belongs_to :live_department
	has_and_belongs_to_many :live_times

	before_save do
		self.title = self.name
		self.onair = "yet"
	end
end
