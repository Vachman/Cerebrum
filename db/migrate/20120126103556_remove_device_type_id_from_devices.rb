class RemoveDeviceTypeIdFromDevices < ActiveRecord::Migration
  def up
    rename_column :devices, :device_type_id, :device_type
    change_column :devices, :device_type, :string
  end

  def down
    rename_column :devices, :device_type, :device_type_id    
  end
end