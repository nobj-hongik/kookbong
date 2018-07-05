class Upost < ActiveRecord::Base
    mount_uploader :image, UpostImageUploader    
    belongs_to :user
    has_many :ucomments, :dependent => :delete_all
    has_many :impressions, :as=>:impressionable  
 
    
   def impression_count
       impressions.size
   end
 
   def unique_impression_count
       # impressions.group(:ip_address).size gives => {'127.0.0.1'=>9, '0.0.0.0'=>1}
       # so getting keys from the hash and calculating the number of keys
       impressions.group(:ip_address).size.keys.length #TESTED
   end 
   
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
