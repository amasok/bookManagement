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

ActiveRecord::Schema.define(version: 20150704154735) do

  create_table "books", force: :cascade do |t|
    t.integer  "isbn",        limit: 8,     null: false
    t.string   "title",       limit: 255,   null: false
    t.string   "subTitle",    limit: 255
    t.string   "author",      limit: 255,   null: false
    t.string   "publisher",   limit: 255,   null: false
    t.text     "description", limit: 65535
    t.date     "salesDate"
    t.integer  "itemPrice",   limit: 4
    t.string   "itemUrl",     limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "books", ["title", "subTitle"], name: "index_books_on_title_and_subTitle", unique: true, using: :btree

  create_table "user_books", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "book_id",    limit: 4
    t.string   "comment",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "user_books", ["book_id", "user_id"], name: "index_user_books_on_book_id_and_user_id", unique: true, using: :btree
  add_index "user_books", ["book_id"], name: "index_user_books_on_book_id", using: :btree
  add_index "user_books", ["user_id", "book_id"], name: "index_user_books_on_user_id_and_book_id", unique: true, using: :btree
  add_index "user_books", ["user_id"], name: "index_user_books_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.string   "name",       limit: 255
    t.string   "mail",       limit: 255
    t.string   "image_url",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree

  add_foreign_key "user_books", "books"
  add_foreign_key "user_books", "users"
end
