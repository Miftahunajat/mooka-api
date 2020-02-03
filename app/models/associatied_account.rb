class AssociatiedAccount < ApplicationRecord
  belongs_to :umkm
  belongs_to :product
  validates :type_name, presence: true
  validates_uniqueness_of :product_id, scope: [:umkm_id, :type_name]

end
