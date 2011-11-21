class AddPorchToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :porch, :string
  end
end
