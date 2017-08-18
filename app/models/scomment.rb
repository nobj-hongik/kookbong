class Scomment < ActiveRecord::Base
    belongs_to :user
    belongs_to :support      
end
