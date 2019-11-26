class Product < ApplicationRecord
  belongs_to :umkm
  has_many :ulasans
end
