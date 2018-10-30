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

ActiveRecord::Schema.define(version: 2018_10_30_174859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_admins_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_admins_on_resource_type_and_resource_id"
  end

  create_table "coordinators", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_coordinators_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_coordinators_on_resource_type_and_resource_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_students_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_students_on_resource_type_and_resource_id"
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

  create_table "users_admins", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_users_admins_on_admin_id"
    t.index ["user_id", "admin_id"], name: "index_users_admins_on_user_id_and_admin_id"
    t.index ["user_id"], name: "index_users_admins_on_user_id"
  end

  create_table "users_coordinators", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "coordinator_id"
    t.index ["coordinator_id"], name: "index_users_coordinators_on_coordinator_id"
    t.index ["user_id", "coordinator_id"], name: "index_users_coordinators_on_user_id_and_coordinator_id"
    t.index ["user_id"], name: "index_users_coordinators_on_user_id"
  end

  create_table "users_students", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "student_id"
    t.index ["student_id"], name: "index_users_students_on_student_id"
    t.index ["user_id", "student_id"], name: "index_users_students_on_user_id_and_student_id"
    t.index ["user_id"], name: "index_users_students_on_user_id"
  end

end
