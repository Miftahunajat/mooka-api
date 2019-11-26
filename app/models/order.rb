class Order < ApplicationRecord
  belongs_to :umkm
  belongs_to :user
  belongs_to :product
end
