class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook,:kakao]
   mount_uploader :avatar, AvatarUploader         
   has_many :eposts, :dependent => :delete_all
   has_many :tposts, :dependent => :delete_all
   has_many :uposts, :dependent => :delete_all
   has_many :ecomments, :dependent => :delete_all
   has_many :tcomments, :dependent => :delete_all   
   has_many :ucomments, :dependent => :delete_all    
  def self.find_for_oauth(auth, signed_in_resource = nil)

    # user와 identity가 nil이 아니라면 받는다
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
    
    # user가 nil이라면 새로 만든다.
    if user.nil?
      
      # 이미 있는 이메일인지 확인한다.
      email = auth.info.email 
      user = User.where(:email => email).first  
      unless self.where(email: auth.info.email).exists?
        
        # 없다면 새로운 데이터를 생성한다.
        if user.nil? && auth.provider=="kakao"
          user = User.new(
            image:  auth.info.image,
            bimage: auth.extra.properties.profile_image,
            name: auth.info.name,
            email: auth.info.email || "#{auth.uid}@kookbbong.com",
            password: Devise.friendly_token[0,20]
          )            
          
          user.save!
        end
        
        if user.nil? && auth.provider=="facebook"
          user = User.new(
            image:  auth.info.image,
            name: auth.info.name,
            email: auth.info.email || "#{auth.uid}@kookbbong.com",
            password: Devise.friendly_token[0,20]
          )            
          
          user.save!
        end  
        
      end
    
    end
    
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
    
  end
  
  def email_required?
    false
  end
 
  def email_changed?
    false
  end
end
