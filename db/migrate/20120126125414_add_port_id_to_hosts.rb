class AddPortIdToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :port_id, :integer 
  end
end
