class Bar < ActiveRecord::Base
    searchkick word_start: [:title, :location]
    mount_uploader :image1,BarImageUploader    
    mount_uploader :image2,BarImageUploader  
    mount_uploader :image3,BarImageUploader  
    mount_uploader :image4,BarImageUploader  
    mount_uploader :image5,BarImageUploader  
    mount_uploader :image6,BarImageUploader  
    mount_uploader :image7,BarImageUploader      
    has_many :barimages, :dependent => :delete_all
    belongs_to :user   
    has_many :bcomments  
end
