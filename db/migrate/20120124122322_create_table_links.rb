class CreateTableLinks < ActiveRecord::Migration
  def up
    create_table :links, :force => true do |t|
      t.string :medium_type
      t.integer :first_member_id
      t.string :first_member_type
      t.integer :second_member_id
      t.string :second_member_type
      t.timestamps
    end
  end

  def down
    drop_table :links
  end
end