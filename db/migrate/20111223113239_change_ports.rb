class ChangePorts < ActiveRecord::Migration
  def up
    remove_column :ports, :member_id
    remove_column :ports, :member_type
    rename_column :ports, :host_id, :device_id
    add_column :ports, :device_type, :string
  end

  def down
    
  end
end