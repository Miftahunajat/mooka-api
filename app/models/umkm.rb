class Umkm < ApplicationRecord
  mount_uploader :image_url, ImagesUploader
  belongs_to :jenis_umkm
end
