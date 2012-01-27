# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120127083423) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "addresses", :force => true do |t|
    t.string   "full"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "buildings", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "housing_id"
    t.integer  "region_id"
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.boolean  "company"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contract"
    t.integer  "building_id"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "device_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "model"
  end

  create_table "devices", :force => true do |t|
    t.string   "name"
    t.string   "device_type"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "devices", ["device_type"], :name => "index_devices_on_device_type_id"

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "position"
    t.integer  "department_id"
    t.string   "number"
    t.string   "email"
  end

  create_table "hosts", :force => true do |t|
    t.string   "hostname"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "building_id"
    t.string   "porch"
    t.datetime "lastms"
    t.integer  "device_type_id"
    t.string   "mac"
    t.string   "firmware"
    t.integer  "log_count"
    t.integer  "port_id"
  end

  create_table "housings", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", :force => true do |t|
    t.string  "medium_type"
    t.integer "port_id"
    t.integer "pair_id"
  end

  create_table "log_messages", :force => true do |t|
    t.string   "message"
    t.string   "facility"
    t.string   "hostname"
    t.integer  "host_id"
    t.datetime "log_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "papers", :force => true do |t|
    t.string   "name"
    t.decimal  "bw_cm_price",    :precision => 10, :scale => 0
    t.decimal  "color_cm_price", :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phones", :force => true do |t|
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "name"
    t.string   "description"
  end

  create_table "ports", :force => true do |t|
    t.string   "name"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "device_type"
  end

  add_index "ports", ["device_id"], :name => "index_ports_on_host_id"

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.integer  "server_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "servers", :force => true do |t|
    t.string   "name"
    t.string   "hostname"
    t.string   "user"
    t.datetime "lastms"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "port"
    t.integer  "building_id"
    t.string   "role"
  end

  create_table "services", :force => true do |t|
    t.string   "name"
    t.decimal  "price",      :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vlans", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "region_id"
  end

end
