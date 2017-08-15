class BarsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
before_action :check_ownership, only: [:edit, :update, :destroy]

  def index
   @posts = Bar.all.order('created_at DESC')
  end
  
  def create
      new_post = Bar.new(user_id: current_user.id, title: params[:title], review: params[:review], grip: params[:grip],equip: params[:squip], simplelocation: params[:simplelocation],location: params[:location], height: params[:height], score: params[:score], image1: params[:image1], image2: params[:image2], image3: params[:image3], image4: params[:image4], image5: params[:image5], image6: params[:image6], image7: params[:image7])
      if new_post.save 
        redirect_to bar_path(new_post.id)
      else
        redirect_to new_bar_path
      end    
  end 
  
  def new
  end 

  def edit
  end

  def show
     @post = Bar.find_by(id: params[:id])
  end
  
  def update
    
      @post.title = params[:title]
      @post.review = params[:review]
      @post.equip = params[:equip]      
      @post.grip = params[:grip]
      @post.height = params[:height]      
      @post.score = params[:score]  
      @post.location = params[:location]       
      @post.simplelocation = params[:simplelocation]        
      @post.image1   = params[:image1] if params[:image1].present?  
      @post.image2   = params[:image2] if params[:image2].present?   
      @post.image3   = params[:image3] if params[:image3].present?   
      @post.image4   = params[:image4] if params[:image4].present?   
      @post.image5   = params[:image5] if params[:image5].present?   
      @post.image6   = params[:image6] if params[:image6].present?   
      @post.image7   = params[:image7] if params[:image7].present?         
      if @post.save
          redirect_to bar_path
      else
          render :edit
      end
  end
  
  def destroy
     @post.destroy
     redirect_to bars_path
  end  

  
  def check_ownership
      @post = Bar.find_by(id: params[:id])
      redirect_to bars_path if @post.user.id != current_user.id    
  end           
end
