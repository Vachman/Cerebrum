class CreateVlans < ActiveRecord::Migration
  def change
    create_table :vlans do |t|
      t.string :name

      t.timestamps
    end
  end
end
