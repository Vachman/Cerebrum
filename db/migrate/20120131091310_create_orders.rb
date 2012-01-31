class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.datetime :due_date
      t.string :ststus
      t.timestamps
    end
    
    create_table :order_servisec do |t|
      t.references :sevice
      t.references :order
      
      t.timestamps
    end
  end
end
