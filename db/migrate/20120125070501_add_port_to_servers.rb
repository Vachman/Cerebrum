class AddPortToServers < ActiveRecord::Migration
  def change
    add_column :servers, :port, :string
  end
end
