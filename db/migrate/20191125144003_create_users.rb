class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nama
      t.string :password
      t.string :email
      t.string :kota
      t.decimal :total_donasi, :precision => 15, :scale => 5, default: 0
      t.decimal :saldo, :precision => 15, :scale => 5, default: 100000
      t.string :no_telfon

      t.timestamps
    end
  end
end
