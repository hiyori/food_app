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

ActiveRecord::Schema.define(version: 20130827064317) do

  create_table "dish_parts", force: true do |t|
    t.integer  "order_id"
    t.integer  "dish_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dish_parts", ["dish_id", "order_id"], name: "index_dish_parts_on_dish_id_and_order_id", unique: true, using: :btree
  add_index "dish_parts", ["dish_id"], name: "index_dish_parts_on_dish_id", using: :btree
  add_index "dish_parts", ["order_id"], name: "index_dish_parts_on_order_id", using: :btree

  create_table "dish_votes", force: true do |t|
    t.integer  "dish_part_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dish_votes", ["dish_part_id"], name: "index_dish_votes_on_dish_part_id", using: :btree
  add_index "dish_votes", ["user_id"], name: "index_dish_votes_on_user_id", using: :btree

  create_table "dishes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurant_parts", force: true do |t|
    t.integer  "order_id"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restaurant_parts", ["order_id"], name: "index_restaurant_parts_on_order_id", using: :btree
  add_index "restaurant_parts", ["restaurant_id", "order_id"], name: "index_restaurant_parts_on_restaurant_id_and_order_id", unique: true, using: :btree
  add_index "restaurant_parts", ["restaurant_id"], name: "index_restaurant_parts_on_restaurant_id", using: :btree

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restaurants", ["name"], name: "index_restaurants_on_name", unique: true, using: :btree

  create_table "restaurants_votes", force: true do |t|
    t.integer  "restaurant_part_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restaurants_votes", ["restaurant_part_id", "user_id"], name: "index_restaurants_votes_on_restaurant_part_id_and_user_id", unique: true, using: :btree
  add_index "restaurants_votes", ["restaurant_part_id"], name: "index_restaurants_votes_on_restaurant_part_id", using: :btree
  add_index "restaurants_votes", ["user_id"], name: "index_restaurants_votes_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "initials"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
