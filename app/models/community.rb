class Community < ApplicationRecord
  mount_uploader :image_url, ImagesUploader
end
