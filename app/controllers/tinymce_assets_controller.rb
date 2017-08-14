class TinymceAssetsController < ApplicationController
protect_from_forgery # Same as above
  def create
    # Take upload from params[:file] and store it somehow...
    # Optionally also accept params[:hint] and consume if needed
    
    image = EpostImage.create params.permit(:file, :alt, :hint)
    
    render json: {
      image: {
        url: image.file.url
      }
    }, content_type: "text/html"
  end
end