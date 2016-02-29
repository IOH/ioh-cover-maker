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

ActiveRecord::Schema.define(version: 20160229135807) do

  create_table "posters", force: :cascade do |t|
    t.integer  "user_id",                     limit: 4
    t.boolean  "use_avatar"
    t.string   "name",                        limit: 255
    t.string   "description",                 limit: 255
    t.string   "info_one",                    limit: 255
    t.boolean  "info_one_red"
    t.string   "info_two",                    limit: 255
    t.boolean  "info_two_red"
    t.string   "info_three",                  limit: 255
    t.boolean  "info_three_red"
    t.string   "location",                    limit: 255
    t.boolean  "location_white"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.text     "avatar_dataUrl",              limit: 4294967295
    t.text     "background_dataUrl",          limit: 4294967295
    t.text     "poster_dataUrl",              limit: 4294967295
    t.text     "original_avatar_dataUrl",     limit: 4294967295
    t.text     "original_background_dataUrl", limit: 4294967295
  end

  add_index "posters", ["user_id"], name: "index_posters_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "account_name",    limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "user_type",       limit: 255
    t.string   "auth_token",      limit: 255
  end

  add_foreign_key "posters", "users"
end
