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

ActiveRecord::Schema.define(:version => 20130517032905) do

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "status",     :default => "new"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "run_cases", :force => true do |t|
    t.integer "run_id"
    t.string  "name"
    t.text    "description"
  end

  create_table "run_steps", :force => true do |t|
    t.integer "run_case_id"
    t.integer "place"
    t.string  "status",      :default => "new"
    t.text    "note"
    t.text    "description"
  end

  create_table "runs", :force => true do |t|
    t.integer "project_id"
    t.string  "name"
    t.string  "status",     :default => "new"
  end

  create_table "steps", :force => true do |t|
    t.integer  "test_case_id"
    t.integer  "place"
    t.string   "status",       :default => "new"
    t.text     "description"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "test_cases", :force => true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.string   "status",      :default => "new"
    t.text     "description"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "users", :force => true do |t|
    t.string "username"
    t.string "email"
    t.string "crypted_password"
    t.string "password_salt"
    t.string "persistence_token"
    t.string "status"
  end

end
