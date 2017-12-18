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

ActiveRecord::Schema.define(version: 20171218094959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "members", force: :cascade do |t|
    t.string  "code"
    t.string  "firstname"
    t.string  "lastname"
    t.string  "nickname"
    t.string  "member_type"
    t.string  "bdate"
    t.string  "regisdate"
    t.string  "expdate"
    t.integer "pc_amount"
    t.integer "pc_balance"
    t.string  "phone"
  end

  create_table "products", force: :cascade do |t|
    t.string   "barcode"
    t.string   "pname"
    t.float    "price",      default: 0.0, null: false
    t.string   "ptype"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "serves", force: :cascade do |t|
    t.date     "date"
    t.string   "checkin_time"
    t.string   "checkout_time"
    t.integer  "member_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["member_id"], name: "index_serves_on_member_id", using: :btree
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "fullname"
    t.string   "nickname"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
