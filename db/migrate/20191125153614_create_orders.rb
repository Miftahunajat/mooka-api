class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :umkm, foreign_key: true
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
