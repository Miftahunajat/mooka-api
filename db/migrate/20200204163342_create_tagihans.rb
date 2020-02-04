class CreateTagihans < ActiveRecord::Migration[5.2]
  def change
    create_table :tagihans do |t|
      t.string :jumlah
      t.references :user, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
