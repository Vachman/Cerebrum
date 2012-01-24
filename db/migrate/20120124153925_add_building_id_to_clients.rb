class AddBuildingIdToClients < ActiveRecord::Migration
  def change
    add_column :clients, :building_id, :integer
  end
end
