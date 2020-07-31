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

ActiveRecord::Schema.define(version: 2020_07_30_140737) do

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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sample_models", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
