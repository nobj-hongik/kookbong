class PostsController < ApplicationController
  def index
      @eposts = Epost.order('created_at DESC').limit(3)
      @bars = Bar.order('created_at DESC').limit(4) 
      @hbars = Bar.order('score DESC').limit(4)   
      @trposts = Upost.where(:category => 2).order("created_at DESC").limit(10)
      @ntposts = Upost.where(:category => 3).order("created_at DESC").limit(10)
      @gnposts = Upost.where(:category => 1).order("created_at DESC").limit(10)
  end
  
  def sorrybut
      render layout: false
  end
  
  def kbeditor
    
  end  
  
  def rule
    
  end
  
end
