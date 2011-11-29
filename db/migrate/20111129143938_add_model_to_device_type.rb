class AddModelToDeviceType < ActiveRecord::Migration
  def change
    add_column :device_types, :model, :string
  end
end
