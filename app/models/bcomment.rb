class Bcomment < ActiveRecord::Base
    belongs_to :user
    belongs_to :bar
    self.per_page = 5       
end
