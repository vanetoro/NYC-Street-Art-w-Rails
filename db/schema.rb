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

ActiveRecord::Schema.define(version: 2018_07_30_214731) do

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "artist_name"
    t.string "bio"
  end

  create_table "murals", force: :cascade do |t|
    t.string "location_details"
    t.integer "neighborhood_id"
    t.integer "artist_id"
    t.integer "active", default: 1
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "uid"
  end

end
