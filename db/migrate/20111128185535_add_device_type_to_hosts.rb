class AddDeviceTypeToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :device_type_id, :integer
  end
end
