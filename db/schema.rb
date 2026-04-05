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

ActiveRecord::Schema[7.2].define(version: 2026_04_05_071354) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brew_notes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "coffee_bean_id"
    t.string "tool"
    t.decimal "dose"
    t.decimal "water_amount"
    t.integer "water_temp"
    t.integer "brew_time"
    t.text "taste_memo"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "grinder"
    t.decimal "grind_size"
    t.index ["coffee_bean_id"], name: "index_brew_notes_on_coffee_bean_id"
    t.index ["user_id"], name: "index_brew_notes_on_user_id"
  end

  create_table "cafe_shops", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "address"
    t.date "visit_date"
    t.text "memo"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cafe_shops_on_user_id"
  end

  create_table "coffee_beans", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "origin"
    t.string "variety"
    t.string "process"
    t.integer "roast_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "flavor"
    t.decimal "aftertaste"
    t.decimal "acidity"
    t.decimal "sweetness"
    t.decimal "mouthfeel"
    t.decimal "acidity_ripeness"
    t.decimal "acidity_complexity"
    t.decimal "thickness"
    t.decimal "roughness"
    t.decimal "dryness"
    t.decimal "astringency"
    t.decimal "harshness"
    t.index ["user_id"], name: "index_coffee_beans_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "brew_notes", "coffee_beans"
  add_foreign_key "brew_notes", "users"
  add_foreign_key "cafe_shops", "users"
  add_foreign_key "coffee_beans", "users"
end
