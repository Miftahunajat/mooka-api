class AddColumnToUmkms < ActiveRecord::Migration[5.2]
  def change
    add_column :umkms, :phone, :string
    add_column :umkms, :password, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
