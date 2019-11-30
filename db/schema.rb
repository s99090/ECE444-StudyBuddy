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

ActiveRecord::Schema.define(version: 2019_11_30_025057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "buddies", force: :cascade do |t|
    t.string "username"
    t.text "description"
    t.string "hourly_rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "fname"
    t.string "lname"
    t.string "courses"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "creater_id", null: false
    t.string "commentable_type", null: false
    t.bigint "commentable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_id"
    t.string "name"
    t.text "subject"
    t.string "term"
    t.string "course_code"
    t.string "students"
    t.text "notes"
    t.string "links"
    t.string "discussions"
    t.string "groups"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "discussions", force: :cascade do |t|
    t.bigint "course_id"
    t.string "discussion_id"
    t.string "discussion_name"
    t.string "discussion_administrator"
    t.string "initial_post"
    t.integer "creater_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_discussions_on_course_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "event_type"
    t.string "name"
    t.text "content"
    t.datetime "datetime"
    t.integer "creater_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_events_on_group_id"
  end

  create_table "group_announcements", force: :cascade do |t|
    t.string "creator"
    t.text "body"
    t.bigint "group_id", null: false
    t.datetime "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_announcements_on_group_id"
  end

  create_table "group_meetings", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.datetime "time"
    t.text "place"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_meetings_on_group_id"
  end

  create_table "groupchats", force: :cascade do |t|
    t.bigint "group_id"
    t.string "groupchat_id"
    t.string "groupchat_name"
    t.string "groupchat_administrator"
    t.string "initial_post"
    t.integer "creater_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_groupchats_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "user_id", null: false
    t.index ["group_id"], name: "index_groups_users_on_group_id"
    t.index ["user_id"], name: "index_groups_users_on_user_id"
  end

  create_table "links", force: :cascade do |t|
    t.bigint "course_id"
    t.string "link_name"
    t.string "link_url"
    t.string "creater_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_links_on_course_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "note_id"
    t.string "title"
    t.bigint "user_id"
    t.bigint "course_id"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_notes_on_course_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "lname"
    t.string "fname"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "events", "groups"
  add_foreign_key "group_announcements", "groups"
  add_foreign_key "group_meetings", "groups"
  add_foreign_key "profiles", "users"
end
