class CreatePorts < ActiveRecord::Migration
  def change
    create_table :ports do |t|
      t.string :name
      t.references :host
      t.integer :member_id
      t.string :member_type

      t.timestamps
    end
    add_index :ports, :host_id
  end
end
