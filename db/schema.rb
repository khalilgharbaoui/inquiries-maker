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

ActiveRecord::Schema.define(version: 2018_06_09_112915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cleaning_inquiries", force: :cascade do |t|
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
    t.boolean "is_moving_request", default: false, null: false
    t.boolean "is_cleaning_request", default: true, null: false
    t.date "cleaning_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "combined_inquiries", force: :cascade do |t|
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
    t.string "client_city"
    t.string "moving_city"
    t.boolean "is_moving_request", default: true, null: false
    t.boolean "is_cleaning_request", default: true, null: false
    t.string "moving_street_and_number"
    t.string "moving_postal_code"
    t.date "moving_date"
    t.date "cleaning_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moving_inquiries", force: :cascade do |t|
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

  create_table "received_inquiry_responses", force: :cascade do |t|
    t.bigint "moving_inquiry_id"
    t.bigint "cleaning_inquiry_id"
    t.bigint "combined_inquiry_id"
    t.jsonb "response_body", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cleaning_inquiry_id"], name: "index_received_inquiry_responses_on_cleaning_inquiry_id"
    t.index ["combined_inquiry_id"], name: "index_received_inquiry_responses_on_combined_inquiry_id"
    t.index ["moving_inquiry_id"], name: "index_received_inquiry_responses_on_moving_inquiry_id"
    t.index ["response_body"], name: "index_received_inquiry_responses_on_response_body"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "received_inquiry_responses", "cleaning_inquiries"
  add_foreign_key "received_inquiry_responses", "combined_inquiries"
  add_foreign_key "received_inquiry_responses", "moving_inquiries"
end
