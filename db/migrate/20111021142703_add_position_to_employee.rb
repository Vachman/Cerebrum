class AddPositionToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :position, :string
  end
end
