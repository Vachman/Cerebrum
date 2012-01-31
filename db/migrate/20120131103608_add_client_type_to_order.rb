class AddClientTypeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :client_type, :string
  end
end
