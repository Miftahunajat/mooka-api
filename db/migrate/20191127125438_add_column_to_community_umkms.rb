class AddColumnToCommunityUmkms < ActiveRecord::Migration[5.2]
  def change
    add_column :community_umkms, :point, :decimal, default: 0
  end
end
