class AddBeratToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :berat, :decimal, default: 0
  end
end
