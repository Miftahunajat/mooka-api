class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :umkm, foreign_key: true
      t.string :gambar
      t.decimal :stock, default: 0
      t.string :title
      t.decimal :harga, default: 0
      t.decimal :rating, :precision => 12, :scale => 2, default: 0
      t.decimal :buy_count, :default => 0

      t.timestamps
    end
  end
end
