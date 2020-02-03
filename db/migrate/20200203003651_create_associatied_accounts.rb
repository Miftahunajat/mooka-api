class CreateAssociatiedAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :associatied_accounts do |t|
      t.string :username
      t.string :password
      t.decimal :type
      t.string :type_name
      t.string :status
      t.string :link
      t.string :otp
      t.references :umkm, foreign_key: true
      t.timestamps
    end
  end
end
