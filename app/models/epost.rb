class Epost < ActiveRecord::Base
    mount_uploader :thumb, EpostthumbUploader
    belongs_to :user
    has_many :ecomments, :dependent => :delete_all
    self.per_page = 9
end
