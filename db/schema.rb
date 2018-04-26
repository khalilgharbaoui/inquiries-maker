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

ActiveRecord::Schema.define(version: 2018_04_21_223558) do

  create_table "cleaning_inquiries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "partner_token"
    t.string "locale", default: "de", null: false
    t.string "client_first_name"
    t.string "client_last_name"
    t.string "client_salutation"
    t.string "client_email"
    t.string "client_mobile"
    t.string "client_street_and_number"
    t.string "client_postal_code"
    t.string "client_property_size"
    t.boolean "is_moving_request", default: false, null: false
    t.boolean "is_cleaning_request", default: true, null: false
    t.date "cleaning_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "combined_inquiries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "partner_token"
    t.string "locale", default: "de", null: false
    t.string "client_first_name"
    t.string "client_last_name"
    t.string "client_salutation"
    t.string "client_email"
    t.string "client_mobile"
    t.string "client_street_and_number"
    t.string "client_postal_code"
    t.string "client_property_size"
    t.boolean "is_moving_request", default: true, null: false
    t.boolean "is_cleaning_request", default: true, null: false
    t.string "moving_street_and_number"
    t.string "moving_postal_code"
    t.date "moving_date"
    t.date "cleaning_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moving_inquiries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "partner_token"
    t.string "locale", default: "de", null: false
    t.string "client_first_name"
    t.string "client_last_name"
    t.string "client_salutation"
    t.string "client_email"
    t.string "client_mobile"
    t.string "client_street_and_number"
    t.string "client_postal_code"
    t.string "client_city"
    t.string "client_property_size"
    t.boolean "is_moving_request", default: true, null: false
    t.boolean "is_cleaning_request", default: false, null: false
    t.string "moving_street_and_number"
    t.string "moving_postal_code"
    t.string "moving_city"
    t.date "moving_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seed_migration_data_migrations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "version"
    t.integer "runtime"
    t.datetime "migrated_on"
  end

end
