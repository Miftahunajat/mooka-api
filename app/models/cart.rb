class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :umkm
  belongs_to :product
end
