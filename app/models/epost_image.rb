class EpostImage < ActiveRecord::Base
    mount_uploader :file, EpostImageUploader
end
