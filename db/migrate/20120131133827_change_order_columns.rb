class ChangeOrderColumns < ActiveRecord::Migration
  def up
    remove_column :orders, :name
    remove_column :orders, :address
    add_column :orders, :client_id, :integer
    
  end

  def down
  end
end