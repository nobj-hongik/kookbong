class Epost < ActiveRecord::Base
    resourcify
    mount_uploader :thumb, EpostthumbUploader
    belongs_to :user
    has_many :ecomments
    self.per_page = 9
end
