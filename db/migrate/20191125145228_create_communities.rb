class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.decimal :member_count
      t.string :title
      t.string :subtitle
      t.string :banner
      t.boolean :official

      t.timestamps
    end
  end
end
