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

ActiveRecord::Schema.define(version: 2021_01_23_170356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "figurine_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["figurine_id"], name: "index_favourites_on_figurine_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "figurines", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.string "brand"
    t.text "description"
    t.integer "like", default: 0
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "media_title"
    t.integer "media_year"
    t.string "media_universe"
    t.integer "likes_count"
    t.integer "price_cents", default: 0, null: false
    t.index ["user_id"], name: "index_figurines_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "figurine_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["figurine_id"], name: "index_likes_on_figurine_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.string "figurine_name"
    t.integer "amount_cents", default: 0, null: false
    t.string "checkout_session_id"
    t.bigint "user_id", null: false
    t.bigint "figurine_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["figurine_id"], name: "index_orders_on_figurine_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.date "birthdate"
    t.string "city"
    t.string "username", default: "Anonymous User"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "figurine_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["figurine_id"], name: "index_reviews_on_figurine_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "admin", default: false, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "favourites", "figurines"
  add_foreign_key "favourites", "users"
  add_foreign_key "figurines", "users"
  add_foreign_key "likes", "figurines"
  add_foreign_key "likes", "users"
  add_foreign_key "orders", "figurines"
  add_foreign_key "orders", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "figurines"
  add_foreign_key "reviews", "users"
end
