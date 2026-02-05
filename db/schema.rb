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

ActiveRecord::Schema[8.1].define(version: 2026_02_05_151849) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "athletes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "initials"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "match_sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "opponent"
    t.integer "opponentScore"
    t.string "our_team"
    t.integer "score"
    t.string "startTime"
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "session_participations", force: :cascade do |t|
    t.bigint "athlete_id", null: false
    t.datetime "created_at", null: false
    t.bigint "match_session_id", null: false
    t.bigint "position_id", null: false
    t.boolean "startingSquad"
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_session_participations_on_athlete_id"
    t.index ["match_session_id"], name: "index_session_participations_on_match_session_id"
    t.index ["position_id"], name: "index_session_participations_on_position_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "name", null: false
    t.string "password_digest", null: false
    t.integer "role"
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "session_participations", "athletes"
  add_foreign_key "session_participations", "match_sessions"
  add_foreign_key "session_participations", "positions"
end
