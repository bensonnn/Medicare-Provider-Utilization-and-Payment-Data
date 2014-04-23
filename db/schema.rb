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

ActiveRecord::Schema.define(version: 20140423211834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: true do |t|
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.integer  "zip"
    t.string   "state"
    t.string   "country"
    t.integer  "provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "short_zip"
  end

  add_index "locations", ["provider_id"], name: "index_locations_on_provider_id", using: :btree

  create_table "providers", force: true do |t|
    t.integer  "npi",           null: false
    t.string   "last_org_name", null: false
    t.string   "first_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "providers", ["npi"], name: "index_providers_on_npi", using: :btree

  create_table "services", force: true do |t|
    t.integer  "hcpcs_code"
    t.string   "hcpcs_description"
    t.float    "line_srvc_cnt"
    t.float    "bene_unique_cnt"
    t.float    "bene_day_srvc_cnt"
    t.float    "avg_med_allow_amt"
    t.float    "stdev_med_allow_amt"
    t.float    "avg_submit_chrg_amt"
    t.float    "stdev_submit_chrg_amt"
    t.float    "avg_med_payment_amt"
    t.float    "stdev_med_payment_amt"
    t.integer  "provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["provider_id"], name: "index_services_on_provider_id", using: :btree

  create_table "zips", force: true do |t|
    t.integer  "zip"
    t.string   "arcs"
    t.float    "avg_1"
    t.float    "avg_2"
    t.float    "avg_3"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "full_zip"
  end

  add_index "zips", ["zip"], name: "index_zips_on_zip", using: :btree

end
