class Upost < ActiveRecord::Base
    mount_uploader :image, UpostImageUploader    
    belongs_to :user
    has_many :ucomments, :dependent => :delete_all
    def self.search1(search)
      where("title LIKE ?", "%#{search}%") 
    end     
    def self.search2(search)
      where("content LIKE ?", "%#{search}%") 
    end       
    def self.search3(search)
      where("title LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%") 
    end   
       
    self.per_page = 10
end
