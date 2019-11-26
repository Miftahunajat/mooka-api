class CreateJenisUmkms < ActiveRecord::Migration[5.2]
  def change
    create_table :jenis_umkms do |t|
      t.string :tipe_umkm

      t.timestamps
    end
  end
end
