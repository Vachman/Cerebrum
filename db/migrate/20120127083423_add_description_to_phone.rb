class AddDescriptionToPhone < ActiveRecord::Migration
  def change
    add_column :phones, :description, :string
  end
end
