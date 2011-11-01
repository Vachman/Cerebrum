class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
