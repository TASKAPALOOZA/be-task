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

ActiveRecord::Schema.define(version: 2022_09_01_164447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.bigint "task_id"
    t.bigint "employee_id"
    t.index ["employee_id"], name: "index_assignments_on_employee_id"
    t.index ["task_id"], name: "index_assignments_on_task_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dept_managers", force: :cascade do |t|
    t.bigint "manager_id"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_dept_managers_on_department_id"
    t.index ["manager_id"], name: "index_dept_managers_on_manager_id"
  end

  create_table "employees", force: :cascade do |t|
    t.bigint "department_id"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "department_id"
    t.integer "scope"
    t.string "title"
    t.string "description"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_tasks_on_department_id"
  end

  add_foreign_key "assignments", "employees"
  add_foreign_key "assignments", "tasks"
  add_foreign_key "dept_managers", "departments"
  add_foreign_key "dept_managers", "managers"
  add_foreign_key "employees", "departments"
  add_foreign_key "tasks", "departments"
end
