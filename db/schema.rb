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

ActiveRecord::Schema.define(version: 2021_06_14_162519) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "profile_image_id"
    t.string "nickname"
    t.string "telephone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "salon_id", null: false
    t.integer "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_favorites_on_customer_id"
    t.index ["salon_id"], name: "index_favorites_on_salon_id"
  end

  create_table "menu_salons", force: :cascade do |t|
    t.integer "salon_id"
    t.integer "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "time"
    t.integer "price"
    t.index ["menu_id"], name: "index_menu_salons_on_menu_id"
    t.index ["salon_id"], name: "index_menu_salons_on_salon_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.integer "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "municipalities", force: :cascade do |t|
    t.string "city_name", limit: 16, null: false
    t.integer "prefecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_municipalities_on_prefecture_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "reservation_id", null: false
    t.integer "menu_id", null: false
    t.string "styling_image_id"
    t.text "comment"
    t.integer "stylist_name"
    t.integer "favorite_rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_order_details_on_menu_id"
    t.index ["reservation_id"], name: "index_order_details_on_reservation_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name", limit: 4, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "salon_id", null: false
    t.date "date", null: false
    t.time "start_time", null: false
    t.time "end_time"
    t.string "ref_image_id"
    t.text "ref_comment"
    t.string "telephone_number", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time", null: false
    t.integer "menu_id", null: false
    t.index ["customer_id"], name: "index_reservations_on_customer_id"
    t.index ["salon_id"], name: "index_reservations_on_salon_id"
  end

  create_table "salons", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "prefecture_id", null: false
    t.integer "municipality_id", null: false
    t.string "name", null: false
    t.string "name_kana", null: false
    t.string "address", null: false
    t.string "telephone_number", null: false
    t.string "salon_image_id"
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.integer "seats", null: false
    t.string "staff_name", null: false
    t.integer "stylists", null: false
    t.text "introduction", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_salons_on_email", unique: true
    t.index ["reset_password_token"], name: "index_salons_on_reset_password_token", unique: true
  end

end
