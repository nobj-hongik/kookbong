class PostsController < ApplicationController
  def index
      @posts = Epost.order('created_at DESC').limit(3)
  end
  
  
end
