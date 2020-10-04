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

ActiveRecord::Schema.define(version: 2020_10_02_101802) do

  create_table "like_models", force: :cascade do |t|
    t.string "ipaddress"
    t.integer "record_id"
    t.integer "like"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rest"
  end

  create_table "nanaos", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.boolean "alcohol"
    t.boolean "mask"
    t.boolean "time"
    t.boolean "takeout"
    t.boolean "touchless"
    t.boolean "card"
    t.boolean "linepay"
    t.boolean "paypay"
    t.boolean "payid"
    t.boolean "quicpay"
    t.boolean "seat"
    t.boolean "contact"
    t.boolean "toilet"
    t.boolean "airing"
    t.boolean "outdoor"
    t.boolean "temp"
    t.string "atom"
    t.boolean "plate"
    t.float "rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nicoles", force: :cascade do |t|
    t.string "name"
    t.string "comment"
    t.string "ipaddress"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rest_models", force: :cascade do |t|
    t.string "name"
    t.string "mask"
    t.string "temp"
    t.string "alcohol"
    t.string "takeout"
    t.string "monday"
    t.string "tuesday"
    t.string "wednesday"
    t.string "thursday"
    t.string "friday"
    t.string "saturday"
    t.string "sunday"
    t.string "googlemap"
    t.string "tabelog"
    t.string "homepage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "area"
    t.string "elec"
    t.string "card"
    t.string "qr"
  end

  create_table "sample_login_models", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sample_models", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sample_rest_models", force: :cascade do |t|
    t.string "name"
    t.integer "mask"
    t.integer "temp"
    t.integer "alcohol"
    t.integer "takeout"
    t.integer "time"
    t.string "googlemap"
    t.string "tabelog"
    t.string "homepage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sample_stack_rest_models", force: :cascade do |t|
    t.string "name"
    t.integer "mask"
    t.integer "temp"
    t.integer "alcohol"
    t.integer "takeout"
    t.integer "time"
    t.string "googlemap"
    t.string "tabelog"
    t.string "homepage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sample_update_models", force: :cascade do |t|
    t.integer "record_id"
    t.integer "mask"
    t.integer "open"
    t.integer "takeout"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rest"
  end

  create_table "sample_user_models", force: :cascade do |t|
    t.string "item"
    t.string "comment"
    t.string "ipaddress"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.integer "rest"
    t.string "nickname"
  end

  create_table "stack_rest_models", force: :cascade do |t|
    t.string "name"
    t.string "mask"
    t.string "temp"
    t.string "alcohol"
    t.string "takeout"
    t.string "monday"
    t.string "tuesday"
    t.string "wednesday"
    t.string "thursday"
    t.string "friday"
    t.string "saturday"
    t.string "sunday"
    t.string "googlemap"
    t.string "tabelog"
    t.string "homepage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "area"
    t.string "elec"
    t.string "card"
    t.string "qr"
  end

  create_table "update_models", force: :cascade do |t|
    t.integer "record_id"
    t.integer "rest"
    t.string "mask"
    t.string "temp"
    t.string "alcohol"
    t.string "takeout"
    t.string "monday"
    t.string "tuesday"
    t.string "wednesday"
    t.string "thursday"
    t.string "friday"
    t.string "saturday"
    t.string "sunday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "elec"
    t.string "card"
    t.string "qr"
  end

  create_table "user_models", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
