class BcommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_ownership!, only: [:update, :destroy]    
  def create
    @post = Bar.find(params[:bar_id])
    @new_comment = Bcomment.new(content: params[:content],
                              bar_id: params[:bar_id],
                              user_id: current_user.id,
                              satisscore: params[:satisscore],
                              equipscore: params[:equipscore]
                              )
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
    @comment = Bcomment.find_by(id: params[:id])
    redirect_to root_path if @comment.user.id != current_user.id
  end                
end
