class CreateLinks < ActiveRecord::Migration
  def up
    create_table :links, :force => true do |t|
      t.string :medium_type
      t.integer :port_id
      t.integer :pair_id
    end
    
    remove_column :housings, :phone
  
  end

  def down
    drop_table :links
  end
end