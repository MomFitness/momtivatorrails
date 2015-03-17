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

ActiveRecord::Schema.define(version: 20150314062651) do

  create_table "equipments", force: true do |t|
    t.string "desc", limit: 256
  end

  create_table "exercise_instructions", force: true do |t|
    t.integer "owner_id"
    t.string  "type",     limit: 256
    t.string  "link",     limit: 256
  end

  create_table "exercise_synonyms", force: true do |t|
    t.string "name", limit: 256
  end

  create_table "exercises", force: true do |t|
    t.integer "type_id",             null: false
    t.integer "user_id",             null: false
    t.string  "name",    limit: 256
    t.integer "goal_id"
    t.string  "focus",   limit: 256
  end

  create_table "feedbacks", force: true do |t|
    t.integer "workout_id",             null: false
    t.integer "mom_id",                 null: false
    t.string  "feedbacks",  limit: 256
  end

  create_table "goals", force: true do |t|
    t.string  "desc",         limit: 256, null: false
    t.integer "goal_type_id",             null: false
  end

  create_table "mistakes", force: true do |t|
    t.integer "exercise_id",             null: false
    t.string  "desc",        limit: 256, null: false
    t.string  "advise",      limit: 256
  end

  create_table "modifications", force: true do |t|
    t.integer "exercise_id",             null: false
    t.string  "level_type",  limit: 250, null: false
    t.string  "desc",        limit: 250, null: false
  end

  create_table "profiles", force: true do |t|
    t.integer "user_id",                        null: false
    t.string  "first_name",         limit: 256, null: false
    t.string  "last_name",          limit: 256, null: false
    t.string  "address",            limit: 256
    t.string  "years_of_exprience", limit: 256
  end

  create_table "repeat_sequences", force: true do |t|
    t.integer "start_sequence_id"
    t.integer "end_sequence_id"
    t.integer "reps"
  end

  create_table "required_tools", force: true do |t|
    t.integer "exercise_id",  null: false
    t.integer "equipment_id", null: false
  end

  create_table "restrictions", force: true do |t|
    t.integer "min_reps"
    t.integer "max_reps"
    t.integer "min_time",    null: false
    t.integer "max_time",    null: false
    t.integer "exercise_id"
  end

  create_table "sequences", force: true do |t|
    t.integer "exercise_id",        null: false
    t.integer "workout_id",         null: false
    t.integer "order",              null: false
    t.integer "repeats",            null: false
    t.integer "duration",           null: false
    t.integer "repeat_sequence_id"
  end

  create_table "types", force: true do |t|
    t.string "desc", limit: 256
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "role",                                null: false
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "workouts", force: true do |t|
    t.string   "name",                  limit: 256, null: false
    t.integer  "mom_id",                            null: false
    t.integer  "trainer_id",                        null: false
    t.integer  "timer",                             null: false
    t.string   "status",                limit: 256
    t.datetime "start"
    t.datetime "end"
    t.string   "focus",                 limit: 256
    t.integer  "feedback_id",                       null: false
    t.integer  "goal_id"
    t.date     "workout_date",                      null: false
    t.string   "workout_schedule_time", limit: 10
  end

end
