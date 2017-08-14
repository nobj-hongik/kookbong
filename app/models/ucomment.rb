class Ucomment < ActiveRecord::Base
    belongs_to :user
    belongs_to :upost         
end
