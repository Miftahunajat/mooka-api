class Umkm < ApplicationRecord
  mount_uploader :image_url, ImagesUploader
  mount_uploader :siup, ImagesUploader
  belongs_to :jenis_umkm
end
