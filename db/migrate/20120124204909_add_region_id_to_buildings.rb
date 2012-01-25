class AddRegionIdToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :region_id, :integer
  end
end
