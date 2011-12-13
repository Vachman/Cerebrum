class AddFirmwareToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :firmware, :string
  end
end
