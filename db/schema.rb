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

ActiveRecord::Schema.define(version: 2021_09_29_132705) do

  create_table "chats", force: :cascade do |t|
    t.text "name"
    t.string "title"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "choices", force: :cascade do |t|
    t.text "content"
    t.boolean "is_answer"
    t.integer "problem_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "student_id", null: false
    t.integer "talk_id", null: false
    t.text "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_comments_on_student_id"
    t.index ["talk_id"], name: "index_comments_on_talk_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "name"
    t.integer "code"
    t.index ["email"], name: "index_groups_on_email", unique: true
    t.index ["reset_password_token"], name: "index_groups_on_reset_password_token", unique: true
  end

  create_table "likes", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "talk_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_likes_on_student_id"
    t.index ["talk_id"], name: "index_likes_on_talk_id"
  end

  create_table "post_tags", force: :cascade do |t|
    t.integer "test_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tag_id"], name: "index_post_tags_on_tag_id"
    t.index ["test_id"], name: "index_post_tags_on_test_id"
  end

  create_table "problems", force: :cascade do |t|
    t.integer "test_id"
    t.string "content"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "right_answer"
  end

  create_table "questions", force: :cascade do |t|
    t.text "name"
    t.string "title"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "answer"
    t.integer "student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "name"
    t.integer "team"
    t.integer "group_code"
    t.integer "point", default: 0
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "talks", force: :cascade do |t|
    t.text "name"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "student_id"
    t.integer "group_id"
  end

  create_table "tests", force: :cascade do |t|
    t.text "title"
    t.string "content"
    t.string "image"
    t.string "advice"
    t.integer "group_code"
    t.integer "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "students"
  add_foreign_key "comments", "talks"
  add_foreign_key "likes", "students"
  add_foreign_key "likes", "talks"
  add_foreign_key "post_tags", "tags"
  add_foreign_key "post_tags", "tests"
end
