class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.references :device_type
      t.references :client

      t.timestamps
    end
    add_index :devices, :device_type_id
  end
end
