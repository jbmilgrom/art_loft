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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140520160416) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "venue_id"
    t.integer  "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "exhibitions", force: true do |t|
    t.integer  "piece_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pieces", force: true do |t|
    t.integer "user_id"
    t.string  "url"
  end

  create_table "rsvps", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "f_name"
    t.string   "l_name"
    t.string   "username"
    t.string   "email"
    t.string   "hashed_password"
    t.boolean  "is_artist"
    t.string   "discipline"
    t.string   "sub_discipline"
    t.text     "abstract"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "has_venue"
    t.text     "bio"
    t.string   "password_salt"
  end

  create_table "venues", force: true do |t|
    t.integer  "user_id"
    t.string   "address"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

end
