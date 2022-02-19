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

ActiveRecord::Schema.define(version: 2022_02_19_115109) do

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sweets_shop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "comment"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sweets_shop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mypages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sweets_shop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sweets_shops", force: :cascade do |t|
    t.integer "user_id"
    t.string "image_id"
    t.string "shop_name"
    t.string "item_name"
    t.string "body"
    t.string "address"
    t.string "genre"
    t.string "regular_holiday"
    t.string "tag"
    t.integer "price"
    t.time "start_time"
    t.time "finish_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "search"
    t.integer "status"
    t.string "prefectures"
  end

  create_table "tag_relationships", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "sweets_shop_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "introduction"
    t.string "image_id"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
