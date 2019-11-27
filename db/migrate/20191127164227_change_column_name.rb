class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :notifications, :type, :tipe
  end
end
