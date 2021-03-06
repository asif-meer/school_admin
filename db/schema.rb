# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150321113128) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "batches", force: true do |t|
    t.string   "batch_name"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "class_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "class_teachers", force: true do |t|
    t.integer  "school_class_id"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classroom_subjects", force: true do |t|
    t.integer  "classroom_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classroom_teachers", force: true do |t|
    t.integer  "classroom_id"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classrooms", force: true do |t|
    t.string   "classroom_name"
    t.string   "short_name"
    t.boolean  "shared"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "course_name"
    t.string   "section_name"
    t.string   "code"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educations", force: true do |t|
    t.string   "institute_name"
    t.string   "degree"
    t.date     "start_date"
    t.date     "completion_date"
    t.boolean  "still_attending", default: false
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emergency_contacts", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "relationship"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_attendances", force: true do |t|
    t.integer  "employee_id"
    t.date     "attendance_date"
    t.string   "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_attendences", force: true do |t|
    t.integer  "employee_id"
    t.date     "date"
    t.integer  "label",       limit: 1, default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_positions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth",        limit: 255
    t.string   "gender"
    t.string   "employee_number"
    t.date     "joining_date"
    t.integer  "department_id"
    t.integer  "employee_position_id"
    t.string   "job_title"
    t.string   "qualification"
    t.string   "total_experience"
    t.text     "present_address"
    t.text     "perminent_address"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "employees", ["department_id"], name: "index_employees_on_department_id"
  add_index "employees", ["employee_position_id"], name: "index_employees_on_employee_position_id"

  create_table "experiences", force: true do |t|
    t.string   "company"
    t.string   "position"
    t.date     "from_date"
    t.date     "to_date"
    t.integer  "teacher_id"
    t.boolean  "still_attending", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fees_categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fees_particulars", force: true do |t|
    t.integer  "fees_category_id"
    t.string   "name"
    t.text     "description"
    t.boolean  "all",              default: false
    t.string   "roll_no"
    t.integer  "batch_id"
    t.string   "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fees_particulars", ["batch_id"], name: "index_fees_particulars_on_batch_id"
  add_index "fees_particulars", ["fees_category_id"], name: "index_fees_particulars_on_fees_category_id"

  create_table "fees_periods", force: true do |t|
    t.integer  "fees_category_id"
    t.integer  "batch_id"
    t.date     "start_date"
    t.date     "end_date"
    t.date     "due_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fees_particular_id"
  end

  create_table "lessons", force: true do |t|
    t.integer  "subject_id"
    t.integer  "period_id"
    t.integer  "teacher_id"
    t.integer  "school_class_id"
    t.integer  "classroom_id"
    t.integer  "week_day_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periods", force: true do |t|
    t.string   "name"
    t.string   "short"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "school_classes", force: true do |t|
    t.string   "name"
    t.integer  "class_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_events", force: true do |t|
    t.string   "Event_name"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_periods", force: true do |t|
    t.integer  "period_id"
    t.integer  "week_day_id"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "school_name"
    t.text     "school_address"
    t.string   "school_email"
    t.string   "school_phone"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string   "name"
    t.date     "from_date"
    t.string   "to_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "nic"
    t.text     "address"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "general_register_number"
    t.date     "joining_date"
    t.integer  "course_id"
    t.integer  "batch_id"
    t.string   "roll_number"
    t.integer  "school_class_id"
    t.integer  "session_id"
  end

  create_table "subject_allocations", force: true do |t|
    t.integer  "department_id"
    t.integer  "employee_id"
    t.integer  "course_id"
    t.integer  "batch_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subject_allocations", ["batch_id"], name: "index_subject_allocations_on_batch_id"
  add_index "subject_allocations", ["course_id"], name: "index_subject_allocations_on_course_id"
  add_index "subject_allocations", ["department_id"], name: "index_subject_allocations_on_department_id"
  add_index "subject_allocations", ["employee_id"], name: "index_subject_allocations_on_employee_id"
  add_index "subject_allocations", ["subject_id"], name: "index_subject_allocations_on_subject_id"

  create_table "subjects", force: true do |t|
    t.integer  "course_id"
    t.integer  "batch_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_name"
    t.string   "color"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count"
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

  create_table "week_days", force: true do |t|
    t.string "name"
  end

end
