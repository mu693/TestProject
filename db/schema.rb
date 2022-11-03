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

ActiveRecord::Schema[7.0].define(version: 2022_11_02_101753) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "appointment_dates", force: :cascade do |t|
    t.bigint "doctor_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["doctor_id"], name: "index_appointment_dates_on_doctor_id"
    t.index ["user_id"], name: "index_appointment_dates_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.bigint "disease_id", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "medicine_id"
    t.bigint "user_id"
    t.index ["disease_id"], name: "index_categories_on_disease_id"
    t.index ["medicine_id"], name: "index_categories_on_medicine_id"
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "couriers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "code"
    t.integer "contact_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_couriers_on_user_id"
  end

  create_table "disease_doctors", force: :cascade do |t|
    t.bigint "disease_id", null: false
    t.bigint "doctor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disease_id"], name: "index_disease_doctors_on_disease_id"
    t.index ["doctor_id"], name: "index_disease_doctors_on_doctor_id"
  end

  create_table "diseases", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_diseases_on_user_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicine_diseases", force: :cascade do |t|
    t.bigint "medicine_id", null: false
    t.bigint "disease_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disease_id"], name: "index_medicine_diseases_on_disease_id"
    t.index ["medicine_id"], name: "index_medicine_diseases_on_medicine_id"
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "quantity"
    t.decimal "price"
    t.date "manfucturing_date"
    t.date "expiry_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_medicines_on_user_id"
  end

  create_table "patient_appointments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "doctor_id", null: false
    t.bigint "user_id", null: false
    t.datetime "date"
    t.bigint "appointment_date_id"
    t.index ["appointment_date_id"], name: "index_patient_appointments_on_appointment_date_id"
    t.index ["doctor_id"], name: "index_patient_appointments_on_doctor_id"
    t.index ["user_id"], name: "index_patient_appointments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "lname"
    t.string "image"
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appointment_dates", "doctors"
  add_foreign_key "appointment_dates", "users"
  add_foreign_key "categories", "diseases"
  add_foreign_key "categories", "medicines"
  add_foreign_key "categories", "users"
  add_foreign_key "couriers", "users"
  add_foreign_key "disease_doctors", "diseases"
  add_foreign_key "disease_doctors", "doctors"
  add_foreign_key "diseases", "users"
  add_foreign_key "medicine_diseases", "diseases"
  add_foreign_key "medicine_diseases", "medicines"
  add_foreign_key "medicines", "users"
  add_foreign_key "patient_appointments", "appointment_dates"
  add_foreign_key "patient_appointments", "doctors"
  add_foreign_key "patient_appointments", "users"
end
