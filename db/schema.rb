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

ActiveRecord::Schema.define(version: 2019_04_09_132033) do

  create_table "meishis", force: :cascade do |t|
    t.string "name"
    t.text "intro"
    t.text "account1_photo"
    t.text "account1_info"
    t.text "account1_display"
    t.text "account2_photo"
    t.text "account2_info"
    t.text "account2_display"
    t.text "account3_photo"
    t.text "account3_info"
    t.text "account3_display"
    t.text "account4_photo"
    t.text "account4_info"
    t.text "account4_display"
    t.text "key"
    t.integer "created_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "intro2"
    t.string "number"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
