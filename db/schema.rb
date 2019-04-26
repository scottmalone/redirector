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

ActiveRecord::Schema.define(version: 2019_04_25_213744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "original_links", force: :cascade do |t|
    t.string "original_url", null: false
    t.integer "short_links_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["original_url"], name: "index_original_links_on_original_url", unique: true
  end

  create_table "reports", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url", null: false
    t.index ["name"], name: "index_reports_on_name", unique: true
  end

  create_table "short_link_visits", force: :cascade do |t|
    t.bigint "short_link_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["short_link_id"], name: "index_short_link_visits_on_short_link_id"
  end

  create_table "short_links", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "original_link_id", null: false
    t.string "short_url_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["original_link_id"], name: "index_short_links_on_original_link_id"
    t.index ["short_url_code"], name: "index_short_links_on_short_url_code", unique: true
    t.index ["user_id"], name: "index_short_links_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "short_link_visits", "short_links"
end
