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

ActiveRecord::Schema.define(version: 20160512220401) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "cnpj"
    t.string   "address"
    t.string   "mail"
    t.string   "phone"
    t.string   "company_name"
    t.string   "contact"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.string   "customer"
    t.date     "started_at"
    t.date     "finished_at"
    t.string   "price"
    t.string   "address"
    t.string   "contact"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "contracts_equipment", id: false, force: :cascade do |t|
    t.integer "contract_id",  null: false
    t.integer "equipment_id", null: false
  end

  add_index "contracts_equipment", ["contract_id", "equipment_id"], name: "index_contracts_equipment_on_contract_id_and_equipment_id"
  add_index "contracts_equipment", ["equipment_id", "contract_id"], name: "index_contracts_equipment_on_equipment_id_and_contract_id"

  create_table "equipment", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "prices", force: :cascade do |t|
    t.integer  "equipment_id"
    t.integer  "deadline"
    t.float    "value"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
