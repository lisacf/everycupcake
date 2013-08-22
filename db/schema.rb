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

ActiveRecord::Schema.define(version: 20130822190458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instructions", force: true do |t|
    t.text     "content"
    t.integer  "preheat"
    t.integer  "baketemp"
    t.integer  "baketime"
    t.integer  "preptime"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "instructions", ["recipe_id"], name: "index_instructions_on_recipe_id", using: :btree

  create_table "measures", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proportions", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.integer  "measure_id"
    t.integer  "unit_id"
    t.string   "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proportions", ["ingredient_id"], name: "index_proportions_on_ingredient_id", using: :btree
  add_index "proportions", ["measure_id"], name: "index_proportions_on_measure_id", using: :btree
  add_index "proportions", ["recipe_id"], name: "index_proportions_on_recipe_id", using: :btree
  add_index "proportions", ["unit_id"], name: "index_proportions_on_unit_id", using: :btree

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "source"
    t.string   "cupcake_part"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id", using: :btree

  create_table "units", force: true do |t|
    t.string   "name"
    t.integer  "measure_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "units", ["measure_id"], name: "index_units_on_measure_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "screen_name"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["screen_name"], name: "index_users_on_screen_name", unique: true, using: :btree

end
