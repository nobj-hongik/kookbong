class Ucomment < ActiveRecord::Base
    belongs_to :user
    belongs_to :upost
    self.per_page = 5    
end
