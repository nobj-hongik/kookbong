class Bar < ActiveRecord::Base
    mount_uploader :image1,BarImageUploader    
    mount_uploader :image2,BarImageUploader  
    mount_uploader :image3,BarImageUploader  
    mount_uploader :image4,BarImageUploader  
    mount_uploader :image5,BarImageUploader  
    mount_uploader :image6,BarImageUploader  
    mount_uploader :image7,BarImageUploader      
    belongs_to :user   
    has_many :bcomments  
    self.per_page = 15    
def self.search(search)
  where("title LIKE ? OR location LIKE ?", "%#{search}%", "%#{search}%") 
end      
end
