# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_27_191522) do

  create_table "countries", force: :cascade do |t|
    t.string "country_code"
    t.integer "panel_provider_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["panel_provider_id"], name: "index_countries_on_panel_provider_id"
  end

  create_table "countries_target_groups", id: false, force: :cascade do |t|
    t.integer "country_id"
    t.integer "target_group_id"
    t.index ["country_id"], name: "index_countries_target_groups_on_country_id"
    t.index ["target_group_id"], name: "index_countries_target_groups_on_target_group_id"
  end

  create_table "location_groups", force: :cascade do |t|
    t.string "name"
    t.integer "country_id", null: false
    t.integer "panel_provider_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_location_groups_on_country_id"
    t.index ["panel_provider_id"], name: "index_location_groups_on_panel_provider_id"
  end

  create_table "location_groups_locations", id: false, force: :cascade do |t|
    t.integer "location_id"
    t.integer "location_group_id"
    t.index ["location_group_id"], name: "index_location_groups_locations_on_location_group_id"
    t.index ["location_id"], name: "index_location_groups_locations_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.integer "external_id"
    t.string "secret_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "panel_providers", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "target_groups", force: :cascade do |t|
    t.string "name"
    t.integer "external_id"
    t.integer "parent_id"
    t.string "secret_code"
    t.integer "panel_provider_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["panel_provider_id"], name: "index_target_groups_on_panel_provider_id"
  end

  add_foreign_key "countries", "panel_providers"
  add_foreign_key "location_groups", "countries"
  add_foreign_key "location_groups", "panel_providers"
  add_foreign_key "target_groups", "panel_providers"
  add_foreign_key "target_groups", "target_groups", column: "parent_id"
end
