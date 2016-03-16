# @editor w2sw2sw2s
# @date 2016/1/27
# @info Add PostersController

class PostersController < ApplicationController
  
  before_action :checkLogIn

  def index
  end

  def show
  end

  def new 

  	@poster = Poster.new()
  	@poster.use_avatar = true
  	@poster.location_white = true
  	@poster.info_one_red = true
  	@poster.info_two_red = false
  	@poster.info_three_red = false

  	@poster.user_id = current_user.id
  	@poster.last_edit_id = current_user.id
  	@poster.last_user = current_user.account_name

  	@poster.save

  	redirect_to edit_poster_path(@poster)

  end

  def edit
  	@poster = Poster.find(params[:id])
  end

  def update

  	data = params['data']
  	
  	data.each do |key, item|
  		data[key] = to_b(item)
  	end

  	if data['location_white'] == '白色'
  		data['location_white'] = true
  	else
  		data['location_white'] = false
  	end
  	
  	
  	@poster = Poster.find(params[:id])
  	@poster.use_avatar = data['use_avatar']
  	@poster.name = data['name']
  	@poster.description = data['description'] 	
  	@poster.info_one = data['info_one']
  	@poster.info_one_red = data['info_one_red']	
  	@poster.info_two = data['info_two']
  	@poster.info_two_red = data['info_two_red']
  	@poster.info_three = data['info_three']
  	@poster.info_three_red = data['info_three_red']
  	@poster.location = data['location']
  	@poster.location_white = data['location_white']
  	@poster.avatar_dataUrl = data['avatar_dataUrl']
  	@poster.background_dataUrl = data['background_dataUrl']
  	@poster.poster_dataUrl = data['poster_dataUrl']

    @poster.original_avatar_dataUrl = data['original_avatar_dataUrl']
    @poster.original_background_dataUrl = data['original_background_dataUrl']

    @poster.last_edit_id = current_user.id
    @poster.last_user = current_user.account_name

  	@poster.save


  	render :json => data

  end

  def destroy
  	@poster = Poster.find(params[:id])
  	@poster.destroy

  	redirect_to :root
  end

  def search

  	selectTerm = "id, name, avatar_dataUrl, info_one, info_one_red, info_two, info_two_red, info_three, info_three_red, updated_at, last_user";

  	if params[:state] == "posters"
	  	if params[:query] == ""
	  		@posters = Poster.select(selectTerm).where('updated_at < ?', 7.days.ago).order(updated_at: :desc).limit(params[:limit])
	  	else
	  		whereSearchTerm  = "name LIKE '%#{params[:query]}%'"
	  		whereSearchTerm += "OR description LIKE '%#{params[:query]}%'"
	  		whereSearchTerm += "OR info_one LIKE '%#{params[:query]}%'"
	  		whereSearchTerm += "OR info_two LIKE '%#{params[:query]}%'"
	  		whereSearchTerm += "OR info_three LIKE '%#{params[:query]}%'"

	  		@posters = Poster.select(selectTerm).where('updated_at < ?', 7.days.ago).where(whereSearchTerm).order(updated_at: :desc).limit(params[:limit])
	  	end
	  elsif params[:state] == "latest"
	  	@posters = Poster.where('updated_at >= ?', 7.days.ago).order(updated_at: :desc)
	  elsif params[:state] == "my-posters"
			@posters = Poster.select(selectTerm).where('user_id = ?', current_user.id).order(updated_at: :desc).limit(params[:limit])
	  end

  	render :json => @posters

  end

  private

  def to_b str
  	if str == "true"
  		return true
  	elsif str == "false"
  		return false
  	else
  		return str
  	end
  end

  def checkLogIn
  	unless current_user
  		redirect_to login_path
  	end
  end

end
