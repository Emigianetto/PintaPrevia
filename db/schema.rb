# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161004022358) do

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_bans", force: :cascade do |t|
    t.integer "banning_group_id"
    t.integer "banned_group_id"
  end

  add_index "group_bans", ["banned_group_id"], name: "index_group_bans_on_banned_group_id"
  add_index "group_bans", ["banning_group_id"], name: "index_group_bans_on_banning_group_id"

  create_table "group_matches", force: :cascade do |t|
    t.integer "inviter_group_id"
    t.integer "invited_group_id"
  end

  add_index "group_matches", ["invited_group_id"], name: "index_group_matches_on_invited_group_id"
  add_index "group_matches", ["inviter_group_id"], name: "index_group_matches_on_inviter_group_id"

  create_table "previa_group_properties", id: false, force: :cascade do |t|
    t.integer "previa_group_id", null: false
    t.integer "property_id",     null: false
  end

  create_table "previa_groups", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active"
    t.date     "date"
    t.integer  "leader_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "previa_groups", ["leader_id"], name: "index_previa_groups_on_leader_id"

  create_table "previa_groups_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "previa_group_id"
  end

  add_index "previa_groups_users", ["previa_group_id"], name: "index_previa_groups_users_on_previa_group_id"
  add_index "previa_groups_users", ["user_id"], name: "index_previa_groups_users_on_user_id"

  create_table "previa_invitations", force: :cascade do |t|
    t.date     "date"
    t.integer  "previa_group_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "previa_invitations", ["previa_group_id"], name: "index_previa_invitations_on_previa_group_id"

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_bans", force: :cascade do |t|
    t.integer "user_id"
    t.integer "previa_group_id"
  end

  add_index "user_bans", ["previa_group_id"], name: "index_user_bans_on_previa_group_id"
  add_index "user_bans", ["user_id"], name: "index_user_bans_on_user_id"

  create_table "user_invitations", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "previa_group_id"
  end

  add_index "user_invitations", ["previa_group_id"], name: "index_user_invitations_on_previa_group_id"
  add_index "user_invitations", ["user_id"], name: "index_user_invitations_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "pass"
    t.string   "email"
    t.string   "gender"
    t.date     "birth_date"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id"

end
