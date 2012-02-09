class DeleteCategoryFromServices < ActiveRecord::Migration
  def up
    remove_column :services, :category
  end

  def down
  end
end
