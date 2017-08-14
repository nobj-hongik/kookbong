class UcommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_ownership!, only: [:update, :destroy]    
  def create
    @post = Upost.find(params[:upost_id])
    @new_comment = Ucomment.new(content: params[:content],
                              upost_id: params[:upost_id],
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
    @comment = Ucomment.find_by(id: params[:id])
    redirect_to root_path if @comment.user.id != current_user.id
  end               
end
