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

ActiveRecord::Schema[7.0].define(version: 2025_02_02_060013) do
  create_table "messages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "doctor_id"
    t.integer "order_id", null: false
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_messages_on_doctor_id"
    t.index ["order_id"], name: "index_messages_on_order_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "doctor_id", null: false
    t.string "order_items"
    t.decimal "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_orders_on_doctor_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "support_messages", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.integer "order_id", null: false
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_support_messages_on_order_id"
    t.index ["receiver_id"], name: "index_support_messages_on_receiver_id"
    t.index ["sender_id"], name: "index_support_messages_on_sender_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "credit_card_number"
    t.string "expiry"
    t.string "cvv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "is_doctor", default: false
    t.boolean "is_support", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "orders"
  add_foreign_key "messages", "users"
  add_foreign_key "messages", "users", column: "doctor_id"
  add_foreign_key "orders", "users"
  add_foreign_key "orders", "users", column: "doctor_id"
  add_foreign_key "support_messages", "orders"
  add_foreign_key "support_messages", "users", column: "receiver_id"
  add_foreign_key "support_messages", "users", column: "sender_id"
end
