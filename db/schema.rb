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

ActiveRecord::Schema.define(version: 20171017151249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "tagline"
    t.string "synopsis"
    t.string "poster"
    t.string "genre"
    t.string "runtime"
    t.string "release_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "api_id"
    t.string "cast"
    t.string "crew"
    t.index ["user_id"], name: "index_movies_on_user_id"
  end

  create_table "seen_movies", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_seen_movies_on_movie_id"
    t.index ["user_id"], name: "index_seen_movies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "auth_token"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username"
  end

end
