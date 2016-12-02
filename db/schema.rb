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

ActiveRecord::Schema.define(version: 20161202012704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "poll_item_types", force: :cascade do |t|
    t.string   "code"
    t.string   "type"
    t.integer  "poll_item_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["poll_item_id"], name: "index_poll_item_types_on_poll_item_id", using: :btree
  end

  create_table "poll_items", force: :cascade do |t|
    t.integer  "score"
    t.boolean  "item_a"
    t.string   "url"
    t.integer  "poll_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "avatar_a_file_name"
    t.string   "avatar_a_content_type"
    t.integer  "avatar_a_file_size"
    t.datetime "avatar_a_updated_at"
    t.string   "avatar_b_file_name"
    t.string   "avatar_b_content_type"
    t.integer  "avatar_b_file_size"
    t.datetime "avatar_b_updated_at"
    t.index ["poll_id"], name: "index_poll_items_on_poll_id", using: :btree
  end

  create_table "polls", force: :cascade do |t|
    t.string   "description"
    t.string   "slug"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "expiration"
    t.index ["user_id"], name: "index_polls_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "picture"
  end

  create_table "votes", force: :cascade do |t|
    t.boolean  "vote"
    t.string   "comment"
    t.string   "session_id"
    t.integer  "poll_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poll_id"], name: "index_votes_on_poll_id", using: :btree
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
  end

  add_foreign_key "poll_item_types", "poll_items"
  add_foreign_key "poll_items", "polls"
  add_foreign_key "polls", "users"
  add_foreign_key "votes", "polls"
  add_foreign_key "votes", "users"
end
