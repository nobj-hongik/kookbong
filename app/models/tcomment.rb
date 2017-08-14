class Tcomment < ActiveRecord::Base
    belongs_to :user
    belongs_to :tpost
end
