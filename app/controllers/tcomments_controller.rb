class TcommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_ownership!, only: [:update, :destroy]    
  def create
    @post = Tpost.find(params[:tpost_id])
    @new_comment = Tcomment.new(content: params[:content],
                              tpost_id: params[:tpost_id],
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
    @comment = Tcomment.find_by(id: params[:id])
    redirect_to root_path if @comment.user.id != current_user.id
  end         
end
