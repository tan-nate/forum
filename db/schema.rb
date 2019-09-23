# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_23_052314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clipboard_quotes", force: :cascade do |t|
    t.integer "clipboard_id"
    t.integer "quote_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clipboards", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "opposes", force: :cascade do |t|
    t.integer "opposer_id"
    t.integer "opposee_id"
    t.integer "relevant_rating"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.string "text"
    t.integer "fact_rating"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "source_url"
    t.integer "topic_id"
  end

  create_table "supports", force: :cascade do |t|
    t.integer "supporter_id"
    t.integer "supportee_id"
    t.integer "relevant_rating"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.integer "place_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_places", force: :cascade do |t|
    t.integer "user_id"
    t.integer "place_id"
  end

  create_table "user_topics", force: :cascade do |t|
    t.integer "user_id"
    t.integer "topic_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "uid"
  end

end
