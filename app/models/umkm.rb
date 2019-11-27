class Umkm < ApplicationRecord
  mount_uploader :gambar, ImagesUploader
  mount_uploader :siup, ImagesUploader
  belongs_to :jenis_umkm
  has_many :orders
end
