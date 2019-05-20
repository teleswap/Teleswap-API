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

ActiveRecord::Schema.define(version: 2019_05_20_034203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acceptable_offers", force: :cascade do |t|
    t.string "title"
    t.integer "year"
    t.string "description"
    t.string "color"
    t.string "image_url"
    t.bigint "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_acceptable_offers_on_listing_id"
  end

  create_table "counter_offers", force: :cascade do |t|
    t.string "title"
    t.integer "year"
    t.string "description"
    t.string "color"
    t.string "image_url"
    t.bigint "listing_id"
    t.bigint "user_id"
    t.bigint "acceptable_offer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["acceptable_offer_id"], name: "index_counter_offers_on_acceptable_offer_id"
    t.index ["listing_id"], name: "index_counter_offers_on_listing_id"
    t.index ["user_id"], name: "index_counter_offers_on_user_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.string "image_url"
    t.float "longitude"
    t.float "latitude"
    t.string "city"
    t.integer "zip_code"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "image_url", default: "https://res.cloudinary.com/dg3xzcms5/image/upload/v1548039381/images/default-profile-icon-24.jpg"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "acceptable_offers", "listings"
  add_foreign_key "counter_offers", "acceptable_offers"
  add_foreign_key "counter_offers", "listings"
  add_foreign_key "counter_offers", "users"
  add_foreign_key "listings", "users"
end
