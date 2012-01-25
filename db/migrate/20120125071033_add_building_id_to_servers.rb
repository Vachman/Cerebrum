class AddBuildingIdToServers < ActiveRecord::Migration
  def change
    add_column :servers, :building_id, :integer
    add_column :servers, :role, :string
  end
end