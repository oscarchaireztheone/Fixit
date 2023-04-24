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

ActiveRecord::Schema.define(version: 2023_04_23_220430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agents", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.boolean "working"
    t.string "employeeNum"
    t.string "other"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

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

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "phone1"
    t.string "phone2"
    t.string "email"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "model"
    t.string "serial"
    t.string "brand"
    t.string "callsid"
    t.text "symptom"
    t.integer "status"
    t.bigint "agent_id", null: false
    t.string "address"
    t.string "window"
    t.bigint "technician_id", null: false
    t.string "day"
    t.string "invoiceNumber"
    t.string "invoicetype"
    t.string "laborCharge"
    t.string "part"
    t.decimal "amtDue"
    t.decimal "taxAmt"
    t.string "other"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["agent_id"], name: "index_orders_on_agent_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["technician_id"], name: "index_orders_on_technician_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.string "payee"
    t.string "meth"
    t.string "idNum"
    t.decimal "amount"
    t.string "other"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.bigint "payment_id", null: false
    t.string "recipient"
    t.string "deliveryway"
    t.string "address"
    t.string "summary"
    t.string "other"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["payment_id"], name: "index_receipts_on_payment_id"
  end

  create_table "reps", force: :cascade do |t|
    t.string "name"
    t.boolean "working"
    t.string "pnum"
    t.string "provider"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "samsungcalls", force: :cascade do |t|
    t.string "fourk"
    t.string "name"
    t.string "phone1"
    t.string "phone2"
    t.string "email"
    t.string "address"
    t.string "zipcode"
    t.boolean "hass"
    t.integer "status"
    t.string "note"
    t.integer "flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "technicians", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "employeeNum"
    t.string "other"
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

  add_foreign_key "orders", "agents"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "technicians"
  add_foreign_key "payments", "orders"
  add_foreign_key "receipts", "payments"
end
