class ChangePriceOnServices < ActiveRecord::Migration
  def up
    change_column :services, :price,  :decimal, :precision => 8, :scale => 2
  end

  def down
  end
end