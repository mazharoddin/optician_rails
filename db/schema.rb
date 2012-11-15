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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121115122148) do

  create_table "countries", :force => true do |t|
    t.string   "name",       :limit => 60
    t.boolean  "enabled"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "employees", :force => true do |t|
    t.string   "first_name",             :limit => 40
    t.string   "last_name",              :limit => 40
    t.string   "email",                                :default => "", :null => false
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.boolean  "active"
    t.boolean  "administrator"
    t.boolean  "dispensing_optician"
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                      :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "personal_title_id"
  end

  add_index "employees", ["email"], :name => "index_employees_on_email", :unique => true
  add_index "employees", ["reset_password_token"], :name => "index_employees_on_reset_password_token", :unique => true
  add_index "employees", ["unlock_token"], :name => "index_employees_on_unlock_token", :unique => true

  create_table "employment_types", :force => true do |t|
    t.string   "name",       :limit => 40
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "genders", :force => true do |t|
    t.string   "name",       :limit => 10
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "guardian_relationships", :force => true do |t|
    t.string   "name",       :limit => 40
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "optometrists", :force => true do |t|
    t.integer  "personal_title_id"
    t.string   "last_name",            :limit => 40
    t.string   "first_name",           :limit => 40
    t.string   "business_name",        :limit => 80
    t.string   "email"
    t.string   "website"
    t.string   "phone",                :limit => 40
    t.string   "fax",                  :limit => 40
    t.string   "business_address"
    t.string   "business_city",        :limit => 80
    t.integer  "business_state_id"
    t.string   "business_postal_code", :limit => 20
    t.integer  "business_country_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "optometrists", ["business_country_id"], :name => "index_optometrists_on_business_country_id"
  add_index "optometrists", ["business_state_id"], :name => "index_optometrists_on_business_state_id"
  add_index "optometrists", ["personal_title_id"], :name => "index_optometrists_on_personal_title_id"

  create_table "patients", :force => true do |t|
    t.integer  "personal_title_id"
    t.string   "last_name",                :limit => 40
    t.string   "first_name",               :limit => 40
    t.string   "preferred_name",           :limit => 40
    t.integer  "gender_id"
    t.date     "birthday"
    t.string   "home_phone",               :limit => 20
    t.string   "work_phone",               :limit => 20
    t.string   "work_ext",                 :limit => 5
    t.string   "mobile_phone",             :limit => 20
    t.string   "email"
    t.string   "home_address"
    t.string   "home_city",                :limit => 80
    t.integer  "home_state_id"
    t.string   "home_postal_code",         :limit => 20
    t.integer  "home_country_id"
    t.string   "postal_address"
    t.string   "postal_city",              :limit => 80
    t.integer  "postal_state_id"
    t.string   "postal_postal_code",       :limit => 20
    t.integer  "postal_country_id"
    t.text     "note"
    t.integer  "optometrist_id"
    t.boolean  "smoker"
    t.text     "alergies"
    t.text     "medical_other"
    t.integer  "employment_type_id"
    t.string   "occupation",               :limit => 80
    t.string   "guardian_name",            :limit => 80
    t.integer  "guardian_relationship_id"
    t.string   "guardian_phone",           :limit => 20
    t.string   "guardian_alt_phone",       :limit => 20
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "patients", ["employment_type_id"], :name => "index_patients_on_employment_type_id"
  add_index "patients", ["gender_id"], :name => "index_patients_on_gender_id"
  add_index "patients", ["guardian_relationship_id"], :name => "index_patients_on_guardian_relationship_id"
  add_index "patients", ["home_country_id"], :name => "index_patients_on_home_country_id"
  add_index "patients", ["home_state_id"], :name => "index_patients_on_home_state_id"
  add_index "patients", ["optometrist_id"], :name => "index_patients_on_optometrist_id"
  add_index "patients", ["personal_title_id"], :name => "index_patients_on_personal_title_id"
  add_index "patients", ["postal_country_id"], :name => "index_patients_on_postal_country_id"
  add_index "patients", ["postal_state_id"], :name => "index_patients_on_postal_state_id"

  create_table "personal_titles", :force => true do |t|
    t.string   "title",      :limit => 20
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "name",       :limit => 60
    t.string   "short_name", :limit => 10
    t.integer  "country_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "states", ["country_id"], :name => "index_states_on_country_id"

  create_table "stores", :force => true do |t|
    t.string   "name",            :limit => 60
    t.string   "email"
    t.string   "url"
    t.string   "phone",           :limit => 30
    t.string   "fax",             :limit => 30
    t.string   "address"
    t.string   "city",            :limit => 60
    t.integer  "state_id"
    t.string   "postal_code",     :limit => 20
    t.integer  "country_id"
    t.time     "monday_open"
    t.time     "monday_close"
    t.time     "tuesday_open"
    t.time     "tuesday_close"
    t.time     "wednesday_open"
    t.time     "wednesday_close"
    t.time     "thursday_open"
    t.time     "thursday_close"
    t.time     "friday_open"
    t.time     "friday_close"
    t.time     "saturday_open"
    t.time     "saturday_close"
    t.time     "sunday_open"
    t.time     "sunday_close"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "stores", ["country_id"], :name => "index_stores_on_country_id"
  add_index "stores", ["state_id"], :name => "index_stores_on_state_id"

end
