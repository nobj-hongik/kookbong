class AdminpostsController < ApplicationController
  def show
    @adminpost = Adminpost.find_by(id: params[:id])
  end
end
