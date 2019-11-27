class Umkm < ApplicationRecord
  mount_uploader :gambar, ImagesUploader
  mount_uploader :siup, ImagesUploader
  belongs_to :jenis_umkm
  has_many :orders
  has_many :products
  has_many :community_umkms
  has_many :communities, through: :community_umkms
end
