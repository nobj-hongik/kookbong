class Tpost < ActiveRecord::Base
    mount_uploader :image, TimageUploader
    belongs_to :user
    has_many :tcomments    
    self.per_page = 5
end
