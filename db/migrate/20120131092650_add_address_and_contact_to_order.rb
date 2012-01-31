class AddAddressAndContactToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :address, :string
    add_column :orders, :contact, :string
  end
end
