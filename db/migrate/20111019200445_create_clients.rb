class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.boolean :company

      t.timestamps
    end
  end
end
