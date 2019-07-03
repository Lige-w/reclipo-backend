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

ActiveRecord::Schema.define(version: 2019_07_03_130044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "middle_initial"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.bigint "reference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reference_id"], name: "index_notes_on_reference_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "reference_authors", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "reference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_reference_authors_on_author_id"
    t.index ["reference_id"], name: "index_reference_authors_on_reference_id"
  end

  create_table "reference_tags", force: :cascade do |t|
    t.bigint "reference_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reference_id"], name: "index_reference_tags_on_reference_id"
    t.index ["tag_id"], name: "index_reference_tags_on_tag_id"
  end

  create_table "references", force: :cascade do |t|
    t.string "publish_date"
    t.string "title"
    t.string "publisher_location"
    t.string "publisher"
    t.bigint "project_id"
    t.string "url"
    t.string "reference_type"
    t.string "page_numbers"
    t.string "volume_number"
    t.string "issue_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "medium"
    t.index ["project_id"], name: "index_references_on_project_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  add_foreign_key "notes", "\"references\"", column: "reference_id"
  add_foreign_key "projects", "users"
  add_foreign_key "reference_authors", "\"references\"", column: "reference_id"
  add_foreign_key "reference_authors", "authors"
  add_foreign_key "reference_tags", "\"references\"", column: "reference_id"
  add_foreign_key "reference_tags", "tags"
  add_foreign_key "references", "projects"
end
