class CreatePengirimen < ActiveRecord::Migration[5.2]
  def change
    create_table :pengirimen do |t|
      t.string :nama
      t.decimal :harga

      t.timestamps
    end
  end
end
