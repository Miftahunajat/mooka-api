class CreateUserTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_types do |t|
      t.string :jenis_user

      t.timestamps
    end
  end
end
