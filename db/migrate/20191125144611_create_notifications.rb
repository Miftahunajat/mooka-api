class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.decimal :type
      t.string :judul
      t.string :text
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
