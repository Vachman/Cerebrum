class AddRegionToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :region, :string
  end
end
