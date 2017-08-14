class EcommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_ownership!, only: [:update, :destroy]    
  def create
    @post = Epost.find(params[:epost_id])
    @new_comment = Ecomment.new(content: params[:content],
                              epost_id: params[:epost_id],
                              user_id: current_user.id)
    if @new_comment.save
      respond_to do |format|
        format.js
      end
    else

    end
  end
 
  def destroy
    if @comment.destroy
      respond_to do |format|
        format.js
      end
    end
  end
  
   private
  def check_ownership!
    @comment = Ecomment.find_by(id: params[:id])
    redirect_to root_path if @comment.user.id != current_user.id
  end     
end
