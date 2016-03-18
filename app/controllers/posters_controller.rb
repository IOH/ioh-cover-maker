# @editor w2sw2sw2s
# @date 2016/1/27
# @info Add PostersController
require 'base64'

class PostersController < ApplicationController
  before_filter :authenticate_user!
  # load_and_authorize_resource
  # before_action :checkLogIn

  def index
  end

  def show
  end

  def new 

  	unless Dir.exist?(Rails.public_path + 'posters')
  		Dir.mkdir(Rails.public_path + 'posters')
  	end

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

  	Dir.mkdir(Rails.public_path + 'posters/' + @poster.id.to_s)

  	redirect_to edit_poster_path(@poster)

  end

  def edit

  	@poster = Poster.find(params[:id])
  	# @poster = Poster.find(params[:id])

  	avatar_dataUrl = getImg(@poster.id, "avatar")
  	background_dataUrl = getImg(@poster.id, "background")
  	original_avatar_dataUrl = getImg(@poster.id, "original_avatar")
  	original_background_dataUrl = getImg(@poster.id, "original_background")

  	@posterData = {
  		avatar: avatar_dataUrl,
  		background: background_dataUrl,
  		original_avatar: original_avatar_dataUrl,
  		original_background: original_background_dataUrl 
  	}
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

    @poster.last_edit_id = current_user.id
    @poster.last_user = current_user.account_name

  	@poster.save

  	saveImg(@poster.id.to_s, data['avatar_dataUrl'], "avatar")
  	saveImg(@poster.id.to_s, data['background_dataUrl'], "background")
  	saveImg(@poster.id.to_s, data['poster_dataUrl'], "poster")
  	saveImg(@poster.id.to_s, data['original_background_dataUrl'], "original_background")
  	saveImg(@poster.id.to_s, data['original_avatar_dataUrl'], "original_avatar")

  	render :json => data

  end

  def destroy
  	@poster = Poster.find(params[:id])
  	@poster.destroy

  	redirect_to :root
  end

  def search

  	selectTerm = "id, name, info_one, info_one_red, info_two, info_two_red, info_three, info_three_red, updated_at, last_user";
  	whereSearchTerm  = "name LIKE '%#{params[:query]}%'"
		whereSearchTerm += "OR description LIKE '%#{params[:query]}%'"
		whereSearchTerm += "OR info_one LIKE '%#{params[:query]}%'"
		whereSearchTerm += "OR info_two LIKE '%#{params[:query]}%'"
		whereSearchTerm += "OR info_three LIKE '%#{params[:query]}%'"

  	if params[:state] == "posters"
	  	if params[:query] == ""
	  		@posters = Poster.select(selectTerm).where('updated_at < ?', 7.days.ago).order(updated_at: :desc).limit(params[:limit])
	  	else
	  		@posters = Poster.select(selectTerm).where('updated_at < ?', 7.days.ago).where(whereSearchTerm).order(updated_at: :desc).limit(params[:limit])
	  	end
	  elsif params[:state] == "latest"
	  	if params[:query] == ""
	  		@posters = Poster.where('updated_at >= ?', 7.days.ago).order(updated_at: :desc)
	  	else
	  		@posters = Poster.where('updated_at >= ?', 7.days.ago).where(whereSearchTerm).order(updated_at: :desc)
	  	end
	  elsif params[:state] == "my-posters"
	  	if params == ""
				@posters = Poster.select(selectTerm).where('user_id = ?', current_user.id).order(updated_at: :desc).limit(params[:limit])
	  	else
	  		@posters = Poster.select(selectTerm).where('user_id = ?', current_user.id).where(whereSearchTerm).order(updated_at: :desc).limit(params[:limit])
	  	end
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

  # def checkLogIn
  # 	unless current_user
  # 		redirect_to login_path
  # 	end
  # end

  def saveImg(posterId, dataUrl, dataType)

  	if dataUrl == nil
  		dataUrl = ""
  	end

  	data = Base64.decode64(dataUrl.gsub(/[^,]+,/, ""))

    puts posterId

  	File.open("#{Rails.root}/public" + '/posters/' + posterId.to_s + '/' + "#{dataType}.jpg", 'wb') do |file|
  		file.write(data)
  	end

  end

  def getImg(posterId, dataType)

  	dataUrl = ""

	  if File.exist?("#{Rails.root}/public" + '/posters/' + posterId.to_s + '/' + "#{dataType}.jpg")

		  data = File.read("#{Rails.root}/public" + '/posters/' + posterId.to_s + '/' + "#{dataType}.jpg")

	  	dataUrl = "data:image/jpeg;base64," + Base64.encode64(data)

	  end

  	return dataUrl

  end

end
