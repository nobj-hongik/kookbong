class PostsController < ApplicationController
  def index
  end
  
  def profile
      @user = User.find(params[:user_id])
  end  
  
end
