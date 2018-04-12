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

ActiveRecord::Schema.define(version: 20171118061804) do

  create_table "barimages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bar_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bars", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "grip"
    t.string   "location"
    t.string   "height"
    t.string   "review"
    t.integer  "score"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.string   "image6"
    t.string   "image7"
    t.string   "equip"
    t.string   "simplelocation"
    t.string   "point1"
    t.string   "point2"
  end

  create_table "bcomments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bar_id"
    t.text     "content"
    t.integer  "satisscore"
    t.integer  "equipscore"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecomments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "epost_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "epost_images", force: :cascade do |t|
    t.string   "alt"
    t.string   "hint"
    t.string   "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eposts", force: :cascade do |t|
    t.string   "title"
    t.string   "thumb"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "scomments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "support_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supports", force: :cascade do |t|
    t.string   "image"
    t.string   "title"
    t.text     "location"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tcomments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tpost_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tposts", force: :cascade do |t|
    t.text     "content"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ucomments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "upost_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "uposts", force: :cascade do |t|
    t.string   "image"
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "category",   default: 1
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
    t.string   "info",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "image"
    t.string   "avatar"
    t.string   "bimage"
    t.string   "fb"
    t.string   "insta"
    t.integer  "fbcheck"
    t.integer  "instacheck"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
