class AddHousingIdToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :housing_id, :integer
  end
end
