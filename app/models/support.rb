class Support < ActiveRecord::Base
    mount_uploader :image, SupportImageUploader    
    belongs_to :user
    has_many :scomments    
end
