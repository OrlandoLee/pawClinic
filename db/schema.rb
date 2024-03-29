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

ActiveRecord::Schema.define(version: 20140224190305) do

  create_table "answers", force: true do |t|
    t.integer  "expert_id"
    t.string   "content"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experts", force: true do |t|
    t.string   "username"
    t.integer  "level"
    t.integer  "question_answered"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "experts", ["email"], name: "index_experts_on_email", unique: true

  create_table "pet_owners", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "pet"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "pet_owners", ["email"], name: "index_pet_owners_on_email", unique: true

  create_table "questions", force: true do |t|
    t.integer  "pet_owner_id"
    t.string   "content"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
