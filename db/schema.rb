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

ActiveRecord::Schema.define(version: 20171030161421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "communes", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.point "location"
    t.integer "parent_code"
    t.bigint "province_id"
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_communes_on_province_id"
  end

  create_table "distributors", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.string "logo_svg"
    t.string "logo_horizontal_svg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "price_updates", force: :cascade do |t|
    t.bigint "station_id"
    t.integer "gas_93"
    t.integer "gas_95"
    t.integer "gas_97"
    t.integer "diesel"
    t.integer "gnc"
    t.integer "glp"
    t.boolean "current"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_id"], name: "index_price_updates_on_station_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.point "location"
    t.integer "parent_code"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_provinces_on_region_id"
  end

  create_table "regions", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.point "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string "code"
    t.string "business_name"
    t.string "address_street"
    t.string "address_number"
    t.bigint "commune_id"
    t.bigint "distributor_id"
    t.string "schedule"
    t.boolean "cash"
    t.boolean "check"
    t.boolean "bank_card"
    t.boolean "shop_card"
    t.point "location"
    t.boolean "shop"
    t.boolean "pharmacy"
    t.boolean "maintenance"
    t.boolean "self_service"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commune_id"], name: "index_stations_on_commune_id"
    t.index ["distributor_id"], name: "index_stations_on_distributor_id"
  end

  add_foreign_key "communes", "provinces"
  add_foreign_key "price_updates", "stations"
  add_foreign_key "provinces", "regions"
  add_foreign_key "stations", "communes"
  add_foreign_key "stations", "distributors"
end
