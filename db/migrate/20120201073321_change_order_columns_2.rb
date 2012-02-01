class ChangeOrderColumns2 < ActiveRecord::Migration
  def up
  #  add_column :orders, :name, :string
   # remove_column :orders, :client_id
  #  rename_column :orders, :client_type, :company
    add_column :orders, :address, :string
  end

  def down
  end
end