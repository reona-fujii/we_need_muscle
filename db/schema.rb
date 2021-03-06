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

ActiveRecord::Schema.define(version: 2020_12_02_112859) do

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_food_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_food_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "score", precision: 3, scale: 2
  end

  create_table "food_regist_carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_food_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_regist_shows", force: :cascade do |t|
    t.integer "food_regist_id", null: false
    t.integer "post_food_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_regists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "day", null: false
    t.integer "timing", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_foods", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", null: false
    t.text "introduction", null: false
    t.string "food_image_id"
    t.integer "calorie", null: false
    t.integer "protain", null: false
    t.integer "fat", null: false
    t.integer "carbon", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "profile_image_id"
    t.integer "sex"
    t.integer "weight"
    t.integer "height"
    t.integer "exercise"
    t.integer "age"
    t.integer "calorie"
    t.integer "protain"
    t.integer "fat"
    t.integer "carbon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "select_setting", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weight_regists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "day", null: false
    t.float "weight", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
