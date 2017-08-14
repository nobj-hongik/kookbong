class UpostsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
before_action :check_ownership, only: [:edit, :update, :destroy]

  def index
   @posts = Upost.paginate(:page => params[:page]).order('created_at DESC')
  end
  
  def create
      new_post = Upost.new(user_id: current_user.id, title: params[:title], content: params[:content], image: params[:image])
      if new_post.save
        redirect_to upost_path(new_post.id)
      else
        redirect_to new_upost_path
      end    
  end 
  
  def new
  end 

  def edit
  end

  def show
     @post = Upost.find_by(id: params[:id])
  end
  
  def update
    
      @post.title = params[:title]
      @post.content = params[:content]
      @post.image   = params[:image] if params[:image].present?
      
      if @post.save
          redirect_to upost_path
      else
          render :edit
      end
  end
  
  def destroy
     @post.destroy
     redirect_to uposts_path
  end  

  
  def check_ownership
      @post = Upost.find_by(id: params[:id])
      redirect_to uposts_path if @post.user.id != current_user.id    
  end       
end
