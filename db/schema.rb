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

ActiveRecord::Schema.define(version: 2020_08_14_171547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "complaints", force: :cascade do |t|
    t.string "incident_id"
    t.string "incident_type", null: false
    t.date "received_date", null: false
    t.date "completed_date"
    t.string "last_name"
    t.string "first_name"
    t.string "allegation"
    t.string "directive"
    t.string "finding"
    t.string "action_taken"
    t.string "disposition"
    t.string "officer_id"
    t.index ["officer_id"], name: "index_complaints_on_officer_id"
  end

  create_table "officers", id: :string, force: :cascade do |t|
    t.string "employee_id"
    t.string "name", null: false
    t.string "job_profile", null: false
    t.boolean "active", null: false
    t.date "termination_date"
    t.date "rehire_date"
    t.boolean "transferred", null: false
  end

  add_foreign_key "complaints", "officers"
end
