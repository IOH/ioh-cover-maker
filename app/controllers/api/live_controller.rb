class Api::LiveController < ApplicationController
	def index
		@lives = Live.all.select("name, time")

		respond_to do |format|
			format.json { render :json => @lives }
		end
	end
end
