class UsersController < ApplicationController

  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      cookies[:auth_token] = @user.auth_token 
      redirect_to :root
    else
       render :signup
    end
  end

  def login
  end

  def create_login_session
    user = User.find_by_account_name(params[:account_name])
    if user && user.authenticate(params[:password])
      # session[:user_id] = user.id
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end

      redirect_to :root

    else
      redirect_to :login
    end
  end

  def logout
    # session[:user_id] = nil
    cookies.delete(:auth_token)
    redirect_to :root
  end

  private
    def user_params
      params.require(:user).permit!
    end

end