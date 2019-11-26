class CreateCommunityUmkms < ActiveRecord::Migration[5.2]
  def change
    create_table :community_umkms do |t|
      t.references :community, foreign_key: true
      t.references :umkm, foreign_key: true
      t.boolean :is_admin

      t.timestamps
    end
  end
end
