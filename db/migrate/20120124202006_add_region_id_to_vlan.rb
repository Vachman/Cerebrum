class AddRegionIdToVlan < ActiveRecord::Migration
  def change
    add_column :vlans, :region_id, :integer
  end

  create_table :regions, :force => true do |t|
    t.string :name
    t.integer :server_id
    t.timestamps
  end
end