class CreateLogMessages < ActiveRecord::Migration
  def change
    create_table :log_messages do |t|
      t.string :message
      t.string :facility
      t.string :hostname
      t.integer :host_id
      t.datetime :log_time

      t.timestamps
    end
  end
end
