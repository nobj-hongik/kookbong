class PostsController < ApplicationController
  def index
      @eposts = Epost.order('created_at DESC').limit(3)
      @bars = Bar.order('created_at DESC').limit(4)  
  end
  
  def sorrybut
      render layout: false
  end
  
  def kbeditor
    
  end  
  
  def rule
    
  end
  
end
