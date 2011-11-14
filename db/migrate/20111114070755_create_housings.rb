class CreateHousings < ActiveRecord::Migration
  def change
    create_table :housings do |t|
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
