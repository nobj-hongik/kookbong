class Upost < ActiveRecord::Base
    mount_uploader :image, UpostImageUploader    
    belongs_to :user
    has_many :ucomments
    self.per_page = 10
end
