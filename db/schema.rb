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

ActiveRecord::Schema.define(version: 20160923073839) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.text     "content",                     null: false
    t.string   "photo"
    t.integer  "posi_counts", default: 0
    t.integer  "nega_counts", default: 0
    t.boolean  "deleted_flg", default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.boolean  "deleted_flg", default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "favorites", ["question_id"], name: "index_favorites_on_question_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title",                           null: false
    t.text     "content",                         null: false
    t.string   "photo"
    t.integer  "favorite_counts", default: 0
    t.integer  "posi_counts",     default: 0
    t.integer  "nega_counts",     default: 0
    t.boolean  "deleted_flg",     default: false, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id", using: :btree

  create_table "tag_relations", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "tag_id"
    t.boolean  "deleted_flg", default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "tag_relations", ["question_id"], name: "index_tag_relations_on_question_id", using: :btree
  add_index "tag_relations", ["tag_id"], name: "index_tag_relations_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",        default: "",    null: false
    t.boolean  "deleted_flg", default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.text     "content",     default: "",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.string   "avatar"
    t.text     "profile"
    t.integer  "score",                  default: 0,     null: false
    t.boolean  "deleted_flg",            default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.boolean  "is_positive", default: false, null: false
    t.boolean  "deleted_flg", default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "votes", ["answer_id"], name: "index_votes_on_answer_id", using: :btree
  add_index "votes", ["question_id"], name: "index_votes_on_question_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "favorites", "questions"
  add_foreign_key "favorites", "users"
  add_foreign_key "questions", "users"
  add_foreign_key "tag_relations", "questions"
  add_foreign_key "tag_relations", "tags"
  add_foreign_key "votes", "answers"
  add_foreign_key "votes", "questions"
  add_foreign_key "votes", "users"
end
