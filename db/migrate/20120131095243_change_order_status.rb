class ChangeOrderStatus < ActiveRecord::Migration
  def up
    rename_column :orders, :ststus, :status
  end

  def down
  end
end