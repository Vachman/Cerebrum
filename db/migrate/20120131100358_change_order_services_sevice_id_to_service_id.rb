class ChangeOrderServicesSeviceIdToServiceId < ActiveRecord::Migration
  def up
    rename_column :order_Services, :sevice_id, :service_id
  end

  def down
  end
end