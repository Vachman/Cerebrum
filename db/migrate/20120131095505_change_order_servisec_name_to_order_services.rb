class ChangeOrderServisecNameToOrderServices < ActiveRecord::Migration
  def up
    rename_table :order_servisec, :order_services
  end

  def down
  end
end