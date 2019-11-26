class CreateUlasans < ActiveRecord::Migration[5.2]
  def change
    create_table :ulasans do |t|
      t.decimal :rating_count
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
