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

ActiveRecord::Schema.define(version: 2021_01_11_183049) do

  create_table "calls", force: :cascade do |t|
    t.string "name"
    t.string "pnum"
    t.string "address"
    t.string "model"
    t.string "serial"
    t.string "callsid"
    t.string "appdate"
    t.string "symptom"
    t.string "picture"
    t.string "payid"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reps", force: :cascade do |t|
    t.string "name"
    t.boolean "working"
    t.string "pnum"
    t.string "provider"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "web_calls", force: :cascade do |t|
    t.string "name"
    t.string "zipcode"
    t.string "Appliance"
    t.boolean "asap"
    t.string "timestart"
    t.string "timeend"
    t.boolean "closed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
