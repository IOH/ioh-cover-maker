# @editor w2sw2sw2s
# @date 2016/1/27
# @info Add PostersController

class PostersController < ApplicationController
  
  before_action :checkLogIn

  def index

  	@posters = Poster.order(updated_at: :desc).limit(10)

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


  	@poster.save


  	render :json => data

  end

  def destroy
  	@poster = Poster.find(params[:id])
  	@poster.destroy

  	redirect_to :root
  end

  def search

  	@posters = Poster.select("id, name").where("name LIKE ? ", "%#{params[:query]}%").order(updated_at: :desc)

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
