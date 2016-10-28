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

ActiveRecord::Schema.define(version: 20161027014517) do

  create_table "chats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_bans", force: :cascade do |t|
    t.integer "banning_group_id"
    t.integer "banned_group_id"
    t.index ["banned_group_id"], name: "index_group_bans_on_banned_group_id"
    t.index ["banning_group_id"], name: "index_group_bans_on_banning_group_id"
  end

  create_table "group_matches", force: :cascade do |t|
    t.integer "inviter_group_id"
    t.integer "invited_group_id"
    t.index ["invited_group_id"], name: "index_group_matches_on_invited_group_id"
    t.index ["inviter_group_id"], name: "index_group_matches_on_inviter_group_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "message"
    t.integer  "author_id"
    t.integer  "chat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_messages_on_author_id"
    t.index ["chat_id"], name: "index_messages_on_chat_id"
  end

  create_table "previa_group_properties", id: false, force: :cascade do |t|
    t.integer  "previa_group_id"
    t.integer  "property_id"
    t.string   "value"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["previa_group_id"], name: "index_previa_group_properties_on_previa_group_id"
    t.index ["property_id"], name: "index_previa_group_properties_on_property_id"
  end

  create_table "previa_groups", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active"
    t.datetime "date"
    t.integer  "leader_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["leader_id"], name: "index_previa_groups_on_leader_id"
  end

  create_table "previa_groups_chats", id: false, force: :cascade do |t|
    t.integer "chat_id"
    t.integer "previa_group_id"
    t.index ["chat_id"], name: "index_previa_groups_chats_on_chat_id"
    t.index ["previa_group_id"], name: "index_previa_groups_chats_on_previa_group_id"
  end

  create_table "previa_groups_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "previa_group_id"
    t.index ["previa_group_id"], name: "index_previa_groups_users_on_previa_group_id"
    t.index ["user_id"], name: "index_previa_groups_users_on_user_id"
  end

  create_table "previa_invitations", force: :cascade do |t|
    t.datetime "date"
    t.integer  "inviting_group_id"
    t.integer  "invited_group_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["invited_group_id"], name: "index_previa_invitations_on_invited_group_id"
    t.index ["inviting_group_id"], name: "index_previa_invitations_on_inviting_group_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_bans", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "previa_group_id"
    t.index ["previa_group_id"], name: "index_user_bans_on_previa_group_id"
    t.index ["user_id"], name: "index_user_bans_on_user_id"
  end

  create_table "user_invitations", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "previa_group_id"
    t.index ["previa_group_id"], name: "index_user_invitations_on_previa_group_id"
    t.index ["user_id"], name: "index_user_invitations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "pass"
    t.string   "email"
    t.string   "gender"
    t.date     "birth_date"
    t.integer  "city_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_users_on_city_id"
  end

end
