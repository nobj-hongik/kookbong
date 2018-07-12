class Adminpost < ActiveRecord::Base
  belongs_to :admin_user
  has_many :notice_comments
end
