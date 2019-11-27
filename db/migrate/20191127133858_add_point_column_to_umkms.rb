class AddPointColumnToUmkms < ActiveRecord::Migration[5.2]
  def change
    add_column :umkms, :point, :decimal, default: 0
  end
end
