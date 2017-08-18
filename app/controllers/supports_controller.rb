class SupportsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
before_action :check_ownership, only: [:edit, :update, :destroy]

  def masterindex
   @posts = Support.all.order('created_at DESC')  
  end
  
  def index
   @posts = current_user.supports.all.order('created_at DESC')
  end
  
  def create
      new_post = Support.new(user_id: current_user.id, title: params[:title], location: params[:location], content: params[:content], image: params[:image])
      if new_post.save
        redirect_to support_path(new_post.id)
      else
        redirect_to support_path
      end    
  end 
  
  def new
  end 

  def edit
  end

  def show
     @post = Support.find_by(id: params[:id])
  end
  
  def update
    
      @post.title = params[:title]
      @post.location = params[:location]      
      @post.content = params[:content]
      @post.image   = params[:image] if params[:image].present?
      
      if @post.save
          redirect_to support_path
      else
          render :edit
      end
  end
  
  def destroy
     @post.destroy
     redirect_to supports_path
  end  

  
  def check_ownership
      @post = Support.find_by(id: params[:id])
      redirect_to supports_path if @post.user.id != current_user.id    
  end  
end
