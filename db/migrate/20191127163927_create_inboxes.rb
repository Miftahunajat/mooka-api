class CreateInboxes < ActiveRecord::Migration[5.2]
  def change
    create_table :inboxes do |t|
      t.string :tipe
      t.string :judul
      t.string :text
      t.references :umkm, foreign_key: true

      t.timestamps
    end
  end
end
