class AddProductIdToAssociatedAccounts < ActiveRecord::Migration[5.2]
  def change
    remove_column :associatied_accounts, :username
    remove_column :associatied_accounts, :password
    add_reference :associatied_accounts, :product
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
