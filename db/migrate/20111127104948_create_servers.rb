class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.string :hostname
      t.string :user
      t.timestamp :lastms
      
      t.timestamps
    end
  end
end
