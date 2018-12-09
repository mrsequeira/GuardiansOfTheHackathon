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

ActiveRecord::Schema.define(version: 2018_12_09_114712) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mentors", force: :cascade do |t|
    t.string "name_mentor"
    t.string "email_mentor"
    t.string "password_mentor"
    t.boolean "vegan"
    t.string "tshirt_size"
    t.string "mentor_difficulties"
    t.string "mentor_allergies"
  end

  create_table "participants", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.boolean "vegan"
    t.string "tshirt_size"
    t.string "motor_difficulties"
    t.string "allergies"
    t.boolean "caption"
    t.string "phone"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_participants_on_team_id"
  end

  create_table "team_themes", force: :cascade do |t|
    t.bigint "teams_id"
    t.bigint "themes_id"
    t.index ["teams_id"], name: "index_team_themes_on_teams_id"
    t.index ["themes_id"], name: "index_team_themes_on_themes_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "project"
    t.string "description"
    t.datetime "edition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "themes", force: :cascade do |t|
    t.string "name_theme"
    t.string "description_theme"
    t.bigint "mentors_id"
    t.index ["mentors_id"], name: "index_themes_on_mentors_id"
  end

  add_foreign_key "participants", "teams"
  add_foreign_key "team_themes", "teams", column: "teams_id"
  add_foreign_key "team_themes", "themes", column: "themes_id"
  add_foreign_key "themes", "mentors", column: "mentors_id"
end
