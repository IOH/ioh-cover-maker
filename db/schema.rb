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

ActiveRecord::Schema.define(version: 20160705070310) do

  create_table "live_departments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "group",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "live_schools", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "live_times", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "live_times_lives", force: :cascade do |t|
    t.integer "live_id",      limit: 4
    t.integer "live_time_id", limit: 4
  end

  add_index "live_times_lives", ["live_id"], name: "index_live_times_lives_on_live_id", using: :btree
  add_index "live_times_lives", ["live_time_id"], name: "index_live_times_lives_on_live_time_id", using: :btree

  create_table "lives", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "live_school_id",     limit: 4
    t.integer  "live_department_id", limit: 4
    t.string   "title",              limit: 255
    t.string   "onair",              limit: 255
  end

  add_index "lives", ["live_department_id"], name: "index_lives_on_live_department_id", using: :btree
  add_index "lives", ["live_school_id"], name: "index_lives_on_live_school_id", using: :btree

  create_table "posters", force: :cascade do |t|
    t.integer  "user_id",             limit: 4
    t.boolean  "use_avatar"
    t.string   "name",                limit: 255
    t.text     "description",         limit: 65535
    t.string   "info_one",            limit: 255
    t.boolean  "info_one_red"
    t.string   "info_two",            limit: 255
    t.boolean  "info_two_red"
    t.string   "info_three",          limit: 255
    t.boolean  "info_three_red"
    t.string   "location",            limit: 255
    t.boolean  "location_white"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "last_edit_id",        limit: 4
    t.string   "last_user",           limit: 255
    t.boolean  "avatar_upload"
    t.string   "avatar",              limit: 255
    t.string   "background",          limit: 255
    t.string   "original_avatar",     limit: 255
    t.string   "original_background", limit: 255
    t.string   "poster",              limit: 255
  end

  add_index "posters", ["last_edit_id"], name: "index_posters_on_last_edit_id", using: :btree
  add_index "posters", ["user_id"], name: "index_posters_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "account_name",           limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "role_id",                limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "lives", "live_departments"
  add_foreign_key "lives", "live_schools"
  add_foreign_key "posters", "users"
  add_foreign_key "posters", "users", column: "last_edit_id"
  add_foreign_key "users", "roles"
end
