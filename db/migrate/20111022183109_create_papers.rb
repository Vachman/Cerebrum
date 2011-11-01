class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :name
      t.decimal :bw_cm_price
      t.decimal :color_cm_price

      t.timestamps
    end
  end
end
