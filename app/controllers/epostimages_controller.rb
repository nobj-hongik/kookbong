class EpostImagesController < ApplicationController
  def new
    @image = EpostImage.build.params(image_params)
  end

  def show
    @image = EpostImage.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(
      :file,
      :hint,
      :alt,
      )
  end
    
end
