class AddLogCountToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :log_count, :integer
  end
end
