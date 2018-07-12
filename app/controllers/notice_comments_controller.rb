class NoticeCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_ownership!, only: [:update, :destroy]

  def create
    @post = Adminpost.find(params[:adminpost_id])
    @new_comment = Notice_comment.new(content: params[:content],
                              adminpost_id: params[:adminpost_id],
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
    @comment = Admin_comment.find_by(id: params[:id])
    redirect_to root_path if @comment.user.id != current_user.id
  end
end
