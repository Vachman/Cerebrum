class CreateServiceCategories < ActiveRecord::Migration
  def change
    create_table :service_categories do |t|
      t.string :name
      t.timestamps
    end
    
    add_column :services, :service_category_id, :integer
  end
end