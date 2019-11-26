class Product < ApplicationRecord
  belongs_to :umkm
  has_many :ulasans
  mount_uploader :image_url, ImagesUploader
end
