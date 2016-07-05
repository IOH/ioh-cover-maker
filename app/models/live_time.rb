class LiveTime < ActiveRecord::Base
	has_and_belongs_to_many :lives
end
