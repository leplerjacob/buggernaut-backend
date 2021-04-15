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

ActiveRecord::Schema.define(version: 2021_04_09_225217) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'comments', force: :cascade do |t|
    t.bigint 'parent_id'
    t.bigint 'comments_id'
    t.bigint 'user_id'
    t.bigint 'project_id'
    t.bigint 'task_id'
    t.text 'text'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['comments_id'], name: 'index_comments_on_comments_id'
    t.index ['parent_id'], name: 'index_comments_on_parent_id'
    t.index ['project_id'], name: 'index_comments_on_project_id'
    t.index ['task_id'], name: 'index_comments_on_task_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'project_managers', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'project_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['project_id'], name: 'index_project_managers_on_project_id'
    t.index ['user_id'], name: 'index_project_managers_on_user_id'
  end

  create_table 'projects', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.date 'date_start'
    t.date 'date_end'
    t.string 'est_duration'
    t.string 'time_spent'
    t.boolean 'completed', default: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'tasks', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.boolean 'completed', default: false
    t.bigint 'project_id'
    t.bigint 'user_id'
    t.bigint 'assigned_to_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['assigned_to_id'], name: 'index_tasks_on_assigned_to_id'
    t.index ['project_id'], name: 'index_tasks_on_project_id'
    t.index ['user_id'], name: 'index_tasks_on_user_id'
  end

  create_table 'tickets', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.boolean 'resolved', default: false
    t.boolean 'claimed', default: false
    t.bigint 'claimed_by_id'
    t.bigint 'created_by_id'
    t.bigint 'project_id'
    t.bigint 'task_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['claimed_by_id'], name: 'index_tickets_on_claimed_by_id'
    t.index ['created_by_id'], name: 'index_tickets_on_created_by_id'
    t.index ['project_id'], name: 'index_tickets_on_project_id'
    t.index ['task_id'], name: 'index_tickets_on_task_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'phone_number'
    t.string 'email'
    t.string 'role'
    t.string 'username'
    t.string 'password_digest'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
end
