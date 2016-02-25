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

ActiveRecord::Schema.define(version: 20160223041203) do

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"

  create_table "friendings", force: :cascade do |t|
    t.integer  "friend_id",   null: false
    t.integer  "friender_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "friendings", ["friend_id", "friender_id"], name: "index_friendings_on_friend_id_and_friender_id", unique: true

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "likeable_id"
    t.string   "likeable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "likes", ["likeable_id"], name: "index_likes_on_likeable_id"
  add_index "likes", ["likeable_type"], name: "index_likes_on_likeable_type"
  add_index "likes", ["user_id", "likeable_type", "likeable_type"], name: "index_likes_on_user_id_and_likeable_type_and_likeable_type", unique: true
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "photos", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "photos", ["user_id"], name: "index_photos_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.text     "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",        null: false
    t.string   "number"
    t.string   "college"
    t.string   "hometown"
    t.string   "lives"
    t.string   "about"
    t.string   "words"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "avatar_id"
    t.integer  "cover_photo_id"
  end

  add_index "profiles", ["avatar_id"], name: "index_profiles_on_avatar_id"
  add_index "profiles", ["cover_photo_id"], name: "index_profiles_on_cover_photo_id"
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",           null: false
    t.date     "birthday"
    t.string   "gender"
    t.string   "password_digest", null: false
    t.string   "auth_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true
  add_index "users", ["birthday"], name: "index_users_on_birthday"
  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["first_name"], name: "index_users_on_first_name"
  add_index "users", ["gender"], name: "index_users_on_gender"
  add_index "users", ["last_name"], name: "index_users_on_last_name"

end
