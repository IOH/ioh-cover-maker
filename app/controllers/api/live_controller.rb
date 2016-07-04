class Api::LiveController < ApplicationController
	def index
		@lives = Live.joins(:live_department, :live_school)
							   .select("lives.id, lives.name, lives.time, 
							   					live_departments.name as department, 
							   					live_schools.name as school")

		respond_to do |format|
			format.json { render :json => @lives }
		end
	end
end
