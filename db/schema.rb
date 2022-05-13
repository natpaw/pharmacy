# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_12_202259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.decimal "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password"
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.integer "quantity"
    t.boolean "prescription"
    t.boolean "children"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ordered_medicines", force: :cascade do |t|
    t.integer "quantity"
    t.string "presc_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "order_id"
    t.bigint "medicine_id"
    t.index ["medicine_id"], name: "index_ordered_medicines_on_medicine_id"
    t.index ["order_id"], name: "index_ordered_medicines_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "status", default: 0
    t.string "comment"
    t.decimal "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "pharmacist_id"
    t.index ["pharmacist_id"], name: "index_orders_on_pharmacist_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "pharmacists", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.string "number"
    t.date "exp_date"
    t.boolean "children"
    t.integer "status", default: 0
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "medicine_id"
    t.bigint "doctor_id"
    t.bigint "ordered_medicine_id"
    t.index ["doctor_id"], name: "index_prescriptions_on_doctor_id"
    t.index ["medicine_id"], name: "index_prescriptions_on_medicine_id"
    t.index ["ordered_medicine_id"], name: "index_prescriptions_on_ordered_medicine_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password"
  end

  add_foreign_key "ordered_medicines", "medicines"
  add_foreign_key "ordered_medicines", "orders"
  add_foreign_key "orders", "pharmacists"
  add_foreign_key "orders", "users"
  add_foreign_key "prescriptions", "doctors"
  add_foreign_key "prescriptions", "medicines"
  add_foreign_key "prescriptions", "ordered_medicines"
end
