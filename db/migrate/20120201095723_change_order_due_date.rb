class ChangeOrderDueDate < ActiveRecord::Migration
  def up
    change_column :orders, :due_date, :date
    add_column :orders, :due_time, :time
  end

  def down
  end
end