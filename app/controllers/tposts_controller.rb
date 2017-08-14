class TpostsController < ApplicationController
before_action :authenticate_user!
before_action :check_ownership, only: [:edit, :update, :destroy]

  def index
   @user = User.find(params[:user_id])  
   @posts = @user.tposts.paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end  
  
  def create
      new_post = Tpost.new(user_id: current_user.id, content: params[:content], image: params[:image])
      if new_post.save
        redirect_to :controller => "tposts", :action => "index", :user_id => current_user.id
      else
        redirect_to new_tpost_path
      end    
      
  end 
  
  def new
  end 

  def edit
  end

  
  def update
    
      @post.content = params[:content]
      @post.image   = params[:image] if params[:image].present?
      
      if @post.save
          redirect_to :controller => "tposts", :action => "index", :user_id => current_user.id
      else
          render :edit
      end
  end
  
  def destroy
     @post.destroy
     redirect_to :controller => "tposts", :action => "index", :user_id => current_user.id
  end  

  
  def check_ownership
      @post = Tpost.find_by(id: params[:id])
      redirect_to tposts_path if @post.user.id != current_user.id    
  end   
end
