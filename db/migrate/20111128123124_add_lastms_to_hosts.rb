class AddLastmsToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :lastms, :timestamp
  end
end
