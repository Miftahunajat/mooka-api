class Product < ApplicationRecord
  belongs_to :umkm
  has_many :ulasans
  mount_uploader :gambar, ImagesUploader
end
