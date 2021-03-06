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

ActiveRecord::Schema.define(version: 2019_06_29_032137) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abouts", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "attendance_requests", force: :cascade do |t|
    t.bigint "user_id"
    t.string "status", default: "aguardando", comment: "stauts são : [ aguardando, atendido, faltou ]"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "details"
    t.string "priority_student", default: "normal", comment: "prioridades são : [ normal, em condição, outros ]"
    t.index ["user_id"], name: "index_attendance_requests_on_user_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.string "name_student"
    t.string "course_student"
    t.text "comment"
    t.string "priority_student"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "attempt"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_forms", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "requisition_number"
    t.string "sei"
    t.date "received_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_credit_forms_on_user_id"
  end

  create_table "credit_items", force: :cascade do |t|
    t.bigint "credit_form_id"
    t.string "description"
    t.integer "group"
    t.integer "workload"
    t.integer "requested_credits_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credit_form_id"], name: "index_credit_items_on_credit_form_id"
  end

  create_table "reminders", force: :cascade do |t|
    t.text "remind"
    t.datetime "remind_date"
    t.boolean "read"
    t.bigint "user_id"
    t.bigint "attendance_request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendance_request_id"], name: "index_reminders_on_attendance_request_id"
    t.index ["user_id"], name: "index_reminders_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "notices"
    t.string "office_hours"
    t.bigint "course_id"
    t.index ["course_id"], name: "index_users_on_course_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "attendance_requests", "users"
  add_foreign_key "reminders", "attendance_requests"
  add_foreign_key "reminders", "users"
  add_foreign_key "users", "courses"
end
