# @editor w2sw2sw2s
# @date 2016/1/27
# @info Add PostersController

class PostersController < ApplicationController
  def index

  	@posters = Poster.all

  end

  def show
  end
end
