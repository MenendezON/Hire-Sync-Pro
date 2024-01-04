# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_04_005459) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applicants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.string "gender"
    t.string "address"
    t.string "language"
    t.integer "experience"
    t.string "source"
    t.string "resume"
    t.string "cover_letter"
    t.bigint "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_applicants_on_post_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "educations", force: :cascade do |t|
    t.string "institution"
    t.string "degree"
    t.string "field_study"
    t.string "location"
    t.string "graduation_date"
    t.bigint "applicant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_educations_on_applicant_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "title"
    t.string "company"
    t.string "location"
    t.boolean "current"
    t.date "start_date"
    t.date "end_date"
    t.text "description"
    t.bigint "applicant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_experiences_on_applicant_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "slug"
    t.string "title"
    t.string "location"
    t.date "deadline"
    t.text "summary", default: "Not available.", null: false
    t.text "duties", default: "Not available.", null: false
    t.text "qualifications", default: "Not available.", null: false
    t.text "extrat", default: "Not available.", null: false
    t.boolean "available", default: true, null: false
    t.bigint "category_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_posts_on_category_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "full_name", default: "User", null: false
    t.string "uid"
    t.string "avatar_url"
    t.string "provider"
    t.boolean "admin", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applicants", "posts"
  add_foreign_key "categories", "users"
  add_foreign_key "educations", "applicants"
  add_foreign_key "experiences", "applicants"
  add_foreign_key "posts", "categories"
  add_foreign_key "posts", "users"
end
