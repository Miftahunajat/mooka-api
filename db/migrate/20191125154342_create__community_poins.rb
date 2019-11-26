class CreateCommunityPoins < ActiveRecord::Migration[5.2]
  def change
    create_table :_community_poins do |t|
      t.references :community, foreign_key: true
      t.references :umkm, foreign_key: true
      t.decimal :point

      t.timestamps
    end
  end
end
