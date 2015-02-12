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

ActiveRecord::Schema.define(version: 20150212121939) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true
  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "post_categories", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "post_categories", ["category_id"], name: "index_post_categories_on_category_id"
  add_index "post_categories", ["post_id"], name: "index_post_categories_on_post_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.string   "slug"
  end

  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true
  add_index "posts", ["url"], name: "index_posts_on_url", unique: true
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "password_digest"
    t.string   "slug"
    t.string   "role",            default: "user"
    t.string   "time_zone"
  end

  add_index "users", ["slug"], name: "index_users_on_slug", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "votes", force: :cascade do |t|
    t.boolean  "value"
    t.integer  "voteable_id"
    t.string   "voteable_type"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "votes", ["user_id", "voteable_id", "voteable_type"], name: "index_votes_on_user_id_and_voteable_id_and_voteable_type", unique: true
  add_index "votes", ["user_id"], name: "index_votes_on_user_id"
  add_index "votes", ["value"], name: "index_votes_on_value"
  add_index "votes", ["voteable_type", "voteable_id"], name: "index_votes_on_voteable_type_and_voteable_id"

end
