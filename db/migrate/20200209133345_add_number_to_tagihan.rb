class AddNumberToTagihan < ActiveRecord::Migration[5.2]
  def change
    add_column :tagihans, :number, :string
  end
end
