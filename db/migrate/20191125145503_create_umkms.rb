class CreateUmkms < ActiveRecord::Migration[5.2]
  def change
    create_table :umkms do |t|
      t.string :nama
      t.string :email
      t.string :nama_pemilik
      t.string :gambar
      t.string :alamat
      t.references :jenis_umkm, foreign_key: true
      t.string :siup
      t.string :logo
      t.string :kota, default: 'Bojonegoro'

      t.timestamps
    end
  end
end
