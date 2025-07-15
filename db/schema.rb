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

ActiveRecord::Schema[8.0].define(version: 2025_07_11_065929) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_accounts_on_username", unique: true
  end

  create_table "characters", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "class_name", null: false
    t.integer "level", default: 1, null: false
    t.integer "xp", default: 0, null: false
    t.uuid "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_characters_on_account_id"
    t.index ["name", "account_id"], name: "index_characters_on_name_and_account_id", unique: true
  end

  create_table "characters_clans", id: false, force: :cascade do |t|
    t.uuid "character_id", null: false
    t.uuid "clan_id", null: false
    t.index ["character_id", "clan_id"], name: "index_characters_clans_on_character_id_and_clan_id", unique: true
    t.index ["character_id"], name: "index_characters_clans_on_character_id"
    t.index ["clan_id"], name: "index_characters_clans_on_clan_id"
  end

  create_table "clans", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_employees_on_email_address", unique: true
  end

  create_table "players", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email_address"
    t.uuid "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_players_on_account_id", unique: true
    t.index ["email_address"], name: "index_players_on_email_address", unique: true
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_sessions_on_employee_id"
  end

  add_foreign_key "characters", "accounts", on_delete: :cascade
  add_foreign_key "characters_clans", "characters", on_delete: :cascade
  add_foreign_key "characters_clans", "clans", on_delete: :cascade
  add_foreign_key "players", "accounts", on_delete: :cascade
  add_foreign_key "sessions", "employees"
end
