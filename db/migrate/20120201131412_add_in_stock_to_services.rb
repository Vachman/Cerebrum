class AddInStockToServices < ActiveRecord::Migration
  def change
    add_column :services, :in_stock, :string
  end
end
