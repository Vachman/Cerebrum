class AddBuildingIdToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :building_id, :integer
  end
end
