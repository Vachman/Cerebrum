class AddOwnerToPhone < ActiveRecord::Migration
  def change
    add_column :phones, :owner_id, :integer
    add_column :phones, :owner_type, :string
    remove_column :phones, :client_id
  end
end
