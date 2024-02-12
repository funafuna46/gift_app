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

ActiveRecord::Schema[7.0].define(version: 2024_02_09_091542) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "gift_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gift_id"], name: "index_favorites_on_gift_id"
    t.index ["user_id", "gift_id"], name: "index_favorites_on_user_id_and_gift_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "gift_card_templates", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_path"
    t.string "image_url"
    t.boolean "has_message", default: false
  end

  create_table "gift_categories", force: :cascade do |t|
    t.integer "category_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gifts", force: :cascade do |t|
    t.string "design_id"
    t.string "recipient"
    t.string "content"
    t.date "expiration_date"
    t.date "send_date"
    t.boolean "public_status"
    t.bigint "user_id", null: false
    t.bigint "gift_category_id", null: false
    t.bigint "recipient_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gift_category_id"], name: "index_gifts_on_gift_category_id"
    t.index ["recipient_category_id"], name: "index_gifts_on_recipient_category_id"
    t.index ["user_id"], name: "index_gifts_on_user_id"
  end

  create_table "recipient_categories", force: :cascade do |t|
    t.integer "category_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "line_user_id"
    t.string "avatar"
    t.boolean "public_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_user_id"], name: "index_users_on_line_user_id", unique: true
  end

  add_foreign_key "favorites", "gifts"
  add_foreign_key "favorites", "users"
  add_foreign_key "gifts", "gift_categories"
  add_foreign_key "gifts", "recipient_categories"
  add_foreign_key "gifts", "users"
end
