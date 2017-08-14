class EpostsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
before_action :check_ownership, only: [:edit, :update, :destroy]

  def index
   @posts = Epost.paginate(:page => params[:page]).order('created_at DESC')
  end
  
  def create
      new_post = Epost.new(user_id: current_user.id, title: params[:title], content: params[:content], thumb: params[:thumb])
      if new_post.save
        redirect_to epost_path(new_post.id)
      else
        redirect_to new_epost_path
      end    
      
  end 
  
  def new
  end 

  def edit
  end

  def show
     @post = Epost.find_by(id: params[:id])
  end
  
  def update
    
      @post.title = params[:title]
      @post.content = params[:content]
      @post.thumb   = params[:thumb] if params[:thumb].present?
      
      if @post.save
          redirect_to epost_path
      else
          render :edit
      end
  end
  
  def destroy
     @post.destroy
     redirect_to eposts_path
  end  

  
  def check_ownership
      @post = Epost.find_by(id: params[:id])
      redirect_to eposts_path if @post.user.id != current_user.id    
  end   
end
