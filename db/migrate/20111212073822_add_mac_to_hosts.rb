class AddMacToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :mac, :string
  end
end
