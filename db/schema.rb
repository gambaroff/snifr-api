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

ActiveRecord::Schema.define(version: 20170510203638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "users", force: :cascade do |t|
    t.string    "username"
    t.string    "email"
    t.geography "lonlat",                  limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.datetime  "created_at",                                                                          null: false
    t.datetime  "updated_at",                                                                          null: false
    t.string    "encrypted_password",      limit: 128
    t.string    "confirmation_token",      limit: 128
    t.string    "remember_token",          limit: 128
    t.string    "login_token"
    t.datetime  "login_token_valid_until"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

end
