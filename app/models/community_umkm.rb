class CommunityUmkm < ApplicationRecord
  belongs_to :community
  belongs_to :umkm

  validates :community_id, uniqueness: { scope: :umkm_id }
end
