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

ActiveRecord::Schema.define(:version => 20130627121552) do

  create_table "events", :force => true do |t|
    t.integer  "place_id"
    t.string   "name"
    t.string   "short_description"
    t.string   "expanded_description"
    t.datetime "event_start"
    t.datetime "event_end"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "invites", :force => true do |t|
    t.integer  "event_id"
    t.string   "content"
    t.integer  "place_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "taken_by"
    t.boolean  "is_valid"
  end

  create_table "places", :force => true do |t|
    t.string   "name"
    t.string   "vicinity"
    t.string   "type"
    t.string   "formatted_address"
    t.string   "phone"
    t.string   "latlng"
    t.float    "rating"
    t.string   "url"
    t.string   "icon"
    t.string   "html_attributions"
    t.string   "reference"
    t.string   "unique_google_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.boolean  "incomplete"
    t.float    "lat"
    t.float    "lng"
    t.string   "email"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "is_place"
    t.integer  "place_id"
    t.float    "lat"
    t.float    "lng"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
