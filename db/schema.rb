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

ActiveRecord::Schema.define(:version => 20150130181353) do

  create_table "comments", :force => true do |t|
    t.integer  "site"
    t.integer  "comment_id"
    t.string   "text"
    t.integer  "user_id"
    t.datetime "creation_date"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "owner_username"
    t.boolean  "is_flagged"
    t.string   "flag_reason"
  end

  create_table "filters", :force => true do |t|
    t.string   "reason"
    t.integer  "site"
    t.string   "regex"
    t.integer  "created_by"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sites", :force => true do |t|
    t.string   "site_url"
    t.boolean  "get_comments"
    t.string   "site_api_key"
    t.string   "site_name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "icon_url"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
