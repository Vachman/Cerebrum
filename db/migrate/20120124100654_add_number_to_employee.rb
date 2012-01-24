class AddNumberToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :number, :string
  end
end
