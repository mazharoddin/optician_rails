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

ActiveRecord::Schema.define(:version => 20130405065855) do

  create_table "accounts", :force => true do |t|
    t.string   "name",                   :limit => 80,                   :null => false
    t.string   "subdomain",              :limit => 69,                   :null => false
    t.boolean  "active",                               :default => true, :null => false
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.string   "url"
    t.string   "phone",                  :limit => 30
    t.string   "fax",                    :limit => 30
    t.string   "address"
    t.string   "city",                   :limit => 60
    t.integer  "state_id"
    t.string   "postal_code",            :limit => 20
    t.integer  "country_id"
    t.integer  "plan_id",                                                :null => false
    t.integer  "next_patient_number",                  :default => 1,    :null => false
    t.integer  "next_inventory_number",                :default => 1,    :null => false
    t.integer  "next_invoice_number",                  :default => 1,    :null => false
    t.integer  "next_payment_number",                  :default => 1,    :null => false
    t.integer  "next_dispensing_number",               :default => 1,    :null => false
  end

  add_index "accounts", ["name"], :name => "index_accounts_on_name", :unique => true
  add_index "accounts", ["subdomain"], :name => "index_accounts_on_subdomain", :unique => true

  create_table "appointments", :force => true do |t|
    t.integer  "account_id",     :null => false
    t.integer  "patient_id",     :null => false
    t.integer  "optometrist_id", :null => false
    t.integer  "inventory_id",   :null => false
    t.datetime "start_at",       :null => false
    t.integer  "duration",       :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.datetime "checkin_at"
    t.datetime "cancel_at"
  end

  add_index "appointments", ["account_id"], :name => "index_appointments_on_account_id"
  add_index "appointments", ["inventory_id"], :name => "index_appointments_on_inventory_id"
  add_index "appointments", ["optometrist_id"], :name => "index_appointments_on_optometrist_id"
  add_index "appointments", ["patient_id"], :name => "index_appointments_on_patient_id"

  create_table "brand_histories", :force => true do |t|
    t.integer  "brand_id"
    t.string   "name",       :limit => 60,                   :null => false
    t.boolean  "active",                   :default => true, :null => false
    t.datetime "start_at",                                   :null => false
    t.datetime "end_at"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "account_id",                                 :null => false
  end

  add_index "brand_histories", ["account_id"], :name => "index_brand_histories_on_account_id"

  create_table "brands", :force => true do |t|
    t.string   "name",       :limit => 60,                   :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "active",                   :default => true, :null => false
    t.integer  "account_id",                                 :null => false
  end

  add_index "brands", ["account_id"], :name => "index_brands_on_account_id"

  create_table "companies", :force => true do |t|
    t.string   "type",       :limit => 60
    t.string   "name",       :limit => 60,                   :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "active",                   :default => true, :null => false
    t.integer  "account_id",                                 :null => false
  end

  add_index "companies", ["account_id"], :name => "index_companies_on_account_id"

  create_table "countries", :force => true do |t|
    t.string   "name",       :limit => 60,                   :null => false
    t.boolean  "active",                   :default => true, :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "dispensing", :force => true do |t|
    t.string   "type",            :limit => 100
    t.integer  "invoice_id"
    t.integer  "patient_id"
    t.integer  "optometrist_id"
    t.integer  "prescription_id"
    t.date     "rx_date"
    t.date     "expiry_date"
    t.string   "description",     :limit => 80
    t.text     "notes"
    t.decimal  "od_sphere",                      :precision => 10, :scale => 2
    t.decimal  "od_cylinder",                    :precision => 10, :scale => 2
    t.decimal  "od_axis",                        :precision => 10, :scale => 0
    t.decimal  "od_add",                         :precision => 10, :scale => 2
    t.string   "od_base_curve",   :limit => 20
    t.string   "od_diameter",     :limit => 20
    t.string   "od_prism1",       :limit => 20
    t.string   "od_base1",        :limit => 20
    t.string   "od_prism2",       :limit => 20
    t.string   "od_base2",        :limit => 20
    t.integer  "od_brand_id"
    t.decimal  "os_sphere",                      :precision => 10, :scale => 2
    t.decimal  "os_cylinder",                    :precision => 10, :scale => 2
    t.decimal  "os_axis",                        :precision => 10, :scale => 0
    t.decimal  "os_add",                         :precision => 10, :scale => 2
    t.string   "os_base_curve",   :limit => 20
    t.string   "os_diameter",     :limit => 20
    t.string   "os_prism1",       :limit => 20
    t.string   "os_base1",        :limit => 20
    t.string   "os_prism2",       :limit => 20
    t.string   "os_base2",        :limit => 20
    t.integer  "os_brand_id"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
    t.integer  "account_id",                                                    :null => false
  end

  add_index "dispensing", ["account_id"], :name => "index_dispensing_on_account_id"
  add_index "dispensing", ["invoice_id"], :name => "index_dispensing_on_invoice_id"
  add_index "dispensing", ["od_brand_id"], :name => "index_dispensing_on_od_brand_id"
  add_index "dispensing", ["optometrist_id"], :name => "index_dispensing_on_optometrist_id"
  add_index "dispensing", ["os_brand_id"], :name => "index_dispensing_on_os_brand_id"
  add_index "dispensing", ["patient_id"], :name => "index_dispensing_on_patient_id"
  add_index "dispensing", ["prescription_id"], :name => "index_dispensing_on_prescription_id"

  create_table "employment_types", :force => true do |t|
    t.string   "name",       :limit => 60,                   :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "active",                   :default => true, :null => false
  end

  create_table "genders", :force => true do |t|
    t.string   "name",       :limit => 60,                   :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "active",                   :default => true, :null => false
  end

  create_table "guardian_relationships", :force => true do |t|
    t.string   "name",       :limit => 60,                   :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "active",                   :default => true, :null => false
  end

  create_table "inventory", :force => true do |t|
    t.string   "type",                  :limit => 100
    t.string   "description",           :limit => 100,                                                  :null => false
    t.integer  "manufacturer_id"
    t.integer  "supplier_id"
    t.string   "supplier_code",         :limit => 80
    t.decimal  "cost_price",                           :precision => 10, :scale => 2
    t.decimal  "sugested_retail_price",                :precision => 10, :scale => 2
    t.decimal  "regular_retail_price",                 :precision => 10, :scale => 2
    t.decimal  "current_retail_price",                 :precision => 10, :scale => 2
    t.integer  "stock_available"
    t.integer  "stock_reorder"
    t.datetime "created_at",                                                                            :null => false
    t.datetime "updated_at",                                                                            :null => false
    t.string   "model",                 :limit => 60
    t.string   "colour",                :limit => 30
    t.string   "eyesize",               :limit => 10
    t.string   "bridge",                :limit => 10
    t.string   "template",              :limit => 10
    t.boolean  "appointment_type"
    t.integer  "lens_material_id"
    t.integer  "lens_type_id"
    t.boolean  "active",                                                              :default => true, :null => false
    t.string   "upc",                   :limit => 40
    t.boolean  "track_inventory",                                                     :default => true, :null => false
    t.integer  "duration"
    t.integer  "tax_a_id"
    t.integer  "tax_b_id"
    t.integer  "account_id",                                                                            :null => false
    t.integer  "number",                                                                                :null => false
  end

  add_index "inventory", ["account_id", "number"], :name => "index_inventory_on_account_id_and_number", :unique => true
  add_index "inventory", ["account_id"], :name => "index_inventory_on_account_id"
  add_index "inventory", ["manufacturer_id"], :name => "index_inventory_on_manufacturer_id"
  add_index "inventory", ["supplier_id"], :name => "index_inventory_on_supplier_id"

  create_table "inventory_lens_coatings", :force => true do |t|
    t.integer "inventory_id"
    t.integer "lens_coating_id"
  end

  create_table "invoices", :force => true do |t|
    t.datetime "invoice_date"
    t.integer  "patient_id"
    t.string   "name"
    t.string   "address"
    t.string   "city",         :limit => 80
    t.string   "state",        :limit => 10
    t.string   "postal_code",  :limit => 20
    t.string   "country",      :limit => 60
    t.decimal  "total",                      :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.decimal  "paid",                       :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.decimal  "balance",                    :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at",                                                                 :null => false
    t.datetime "updated_at",                                                                 :null => false
    t.datetime "void_date"
    t.integer  "account_id",                                                                 :null => false
    t.datetime "locked_date"
  end

  add_index "invoices", ["account_id"], :name => "index_invoices_on_account_id"
  add_index "invoices", ["patient_id"], :name => "index_invoices_on_patient_id"

  create_table "items", :force => true do |t|
    t.string   "description",                                 :null => false
    t.decimal  "unit_price",   :precision => 10, :scale => 2, :null => false
    t.decimal  "discount",     :precision => 10, :scale => 2, :null => false
    t.decimal  "qty",          :precision => 10, :scale => 2, :null => false
    t.integer  "tax_a_id"
    t.integer  "tax_b_id"
    t.decimal  "tax_a_amount", :precision => 10, :scale => 2
    t.decimal  "tax_b_amount", :precision => 10, :scale => 2
    t.decimal  "total_price",  :precision => 10, :scale => 2, :null => false
    t.integer  "inventory_id"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.integer  "invoice_id",                                  :null => false
    t.integer  "account_id",                                  :null => false
  end

  add_index "items", ["account_id"], :name => "index_items_on_account_id"
  add_index "items", ["inventory_id"], :name => "index_invoice_items_on_inventory_id"
  add_index "items", ["tax_a_id"], :name => "index_invoice_items_on_tax_a_id"
  add_index "items", ["tax_b_id"], :name => "index_invoice_items_on_tax_b_id"

  create_table "lens_coatings", :force => true do |t|
    t.string   "name",       :limit => 60,                   :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "active",                   :default => true, :null => false
  end

  create_table "lens_coatings_inventory", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lens_materials", :force => true do |t|
    t.string   "name",       :limit => 60,                   :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "active",                   :default => true, :null => false
  end

  create_table "lens_types", :force => true do |t|
    t.string   "name",       :limit => 60,                   :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "active",                   :default => true, :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name",              :limit => 60,                   :null => false
    t.string   "email"
    t.string   "url"
    t.string   "phone",             :limit => 30
    t.string   "fax",               :limit => 30
    t.string   "address"
    t.string   "city",              :limit => 60
    t.integer  "state_id"
    t.string   "postal_code",       :limit => 20
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
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.boolean  "active",                          :default => true, :null => false
    t.integer  "account_id",                                        :null => false
    t.string   "company_name",      :limit => 80
    t.integer  "contact_person_id"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean  "open_monday",                     :default => true, :null => false
    t.boolean  "open_tuesday",                    :default => true, :null => false
    t.boolean  "open_wednesday",                  :default => true, :null => false
    t.boolean  "open_thursday",                   :default => true, :null => false
    t.boolean  "open_friday",                     :default => true, :null => false
    t.boolean  "open_saturday",                   :default => true, :null => false
    t.boolean  "open_sunday",                     :default => true, :null => false
  end

  add_index "locations", ["account_id"], :name => "index_stores_on_account_id"
  add_index "locations", ["country_id"], :name => "index_stores_on_country_id"
  add_index "locations", ["state_id"], :name => "index_stores_on_state_id"

  create_table "optometrists", :force => true do |t|
    t.integer  "personal_title_id"
    t.string   "last_name",            :limit => 40,                   :null => false
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
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.boolean  "active",                             :default => true, :null => false
    t.integer  "account_id",                                           :null => false
  end

  add_index "optometrists", ["account_id"], :name => "index_optometrists_on_account_id"
  add_index "optometrists", ["business_country_id"], :name => "index_optometrists_on_business_country_id"
  add_index "optometrists", ["business_state_id"], :name => "index_optometrists_on_business_state_id"
  add_index "optometrists", ["personal_title_id"], :name => "index_optometrists_on_personal_title_id"

  create_table "patients", :force => true do |t|
    t.integer  "personal_title_id"
    t.string   "last_name",                :limit => 40, :null => false
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
    t.integer  "account_id",                             :null => false
    t.integer  "number",                                 :null => false
  end

  add_index "patients", ["account_id", "number"], :name => "index_patients_on_account_id_and_number", :unique => true
  add_index "patients", ["account_id"], :name => "index_patients_on_account_id"
  add_index "patients", ["employment_type_id"], :name => "index_patients_on_employment_type_id"
  add_index "patients", ["gender_id"], :name => "index_patients_on_gender_id"
  add_index "patients", ["guardian_relationship_id"], :name => "index_patients_on_guardian_relationship_id"
  add_index "patients", ["home_country_id"], :name => "index_patients_on_home_country_id"
  add_index "patients", ["home_state_id"], :name => "index_patients_on_home_state_id"
  add_index "patients", ["optometrist_id"], :name => "index_patients_on_optometrist_id"
  add_index "patients", ["personal_title_id"], :name => "index_patients_on_personal_title_id"
  add_index "patients", ["postal_country_id"], :name => "index_patients_on_postal_country_id"
  add_index "patients", ["postal_state_id"], :name => "index_patients_on_postal_state_id"

  create_table "payment_methods", :force => true do |t|
    t.string   "name",       :limit => 20,                   :null => false
    t.integer  "account_id",                                 :null => false
    t.boolean  "active",                   :default => true, :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "payment_methods", ["account_id", "name"], :name => "index_payment_methods_on_account_id_and_name", :unique => true
  add_index "payment_methods", ["account_id"], :name => "index_payment_methods_on_account_id"

  create_table "personal_titles", :force => true do |t|
    t.string   "title",      :limit => 20,                   :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "active",                   :default => true, :null => false
  end

  create_table "plans", :force => true do |t|
    t.string   "name",          :limit => 60,                                                   :null => false
    t.boolean  "active",                                                     :default => true,  :null => false
    t.boolean  "inventory",                                                  :default => false, :null => false
    t.boolean  "multilocation",                                              :default => false, :null => false
    t.decimal  "price",                       :precision => 10, :scale => 2,                    :null => false
    t.datetime "created_at",                                                                    :null => false
    t.datetime "updated_at",                                                                    :null => false
    t.boolean  "appointments",                                               :default => false, :null => false
  end

  add_index "plans", ["name"], :name => "index_plans_on_name", :unique => true

  create_table "prescriptions", :force => true do |t|
    t.string   "type",            :limit => 100
    t.integer  "patient_id"
    t.integer  "optometrist_id"
    t.integer  "prescription_id"
    t.date     "rx_date"
    t.date     "expiry_date"
    t.string   "description",     :limit => 80
    t.text     "notes"
    t.decimal  "od_sphere",                      :precision => 10, :scale => 2
    t.decimal  "od_cylinder",                    :precision => 10, :scale => 2
    t.decimal  "od_axis",                        :precision => 10, :scale => 0
    t.decimal  "od_add",                         :precision => 10, :scale => 2
    t.string   "od_base_curve",   :limit => 20
    t.string   "od_diameter",     :limit => 20
    t.string   "od_prism1",       :limit => 20
    t.string   "od_base1",        :limit => 20
    t.string   "od_prism2",       :limit => 20
    t.string   "od_base2",        :limit => 20
    t.integer  "od_brand_id"
    t.decimal  "os_sphere",                      :precision => 10, :scale => 2
    t.decimal  "os_cylinder",                    :precision => 10, :scale => 2
    t.decimal  "os_axis",                        :precision => 10, :scale => 0
    t.decimal  "os_add",                         :precision => 10, :scale => 2
    t.string   "os_base_curve",   :limit => 20
    t.string   "os_diameter",     :limit => 20
    t.string   "os_prism1",       :limit => 20
    t.string   "os_base1",        :limit => 20
    t.string   "os_prism2",       :limit => 20
    t.string   "os_base2",        :limit => 20
    t.integer  "os_brand_id"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
    t.integer  "account_id",                                                    :null => false
  end

  add_index "prescriptions", ["account_id"], :name => "index_prescriptions_on_account_id"
  add_index "prescriptions", ["od_brand_id"], :name => "index_prescriptions_on_od_brand_id"
  add_index "prescriptions", ["optometrist_id"], :name => "index_prescriptions_on_optometrist_id"
  add_index "prescriptions", ["os_brand_id"], :name => "index_prescriptions_on_os_brand_id"
  add_index "prescriptions", ["patient_id"], :name => "index_prescriptions_on_patient_id"
  add_index "prescriptions", ["prescription_id"], :name => "index_prescriptions_on_prescription_id"

  create_table "states", :force => true do |t|
    t.string   "name",       :limit => 60,                   :null => false
    t.string   "short_name", :limit => 60,                   :null => false
    t.integer  "country_id",                                 :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "active",                   :default => true, :null => false
  end

  add_index "states", ["country_id"], :name => "index_states_on_country_id"

  create_table "tax_histories", :force => true do |t|
    t.integer  "tax_id",                                                                   :null => false
    t.string   "name",       :limit => 40,                                                 :null => false
    t.decimal  "rate",                     :precision => 10, :scale => 4, :default => 0.0, :null => false
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at",                                                               :null => false
    t.datetime "updated_at",                                                               :null => false
    t.integer  "account_id",                                                               :null => false
  end

  add_index "tax_histories", ["account_id"], :name => "index_tax_histories_on_account_id"
  add_index "tax_histories", ["tax_id"], :name => "index_tax_histories_on_tax_id"

  create_table "taxes", :force => true do |t|
    t.string   "name",       :limit => 40,                                                 :null => false
    t.decimal  "rate",                     :precision => 10, :scale => 4, :default => 0.0, :null => false
    t.datetime "created_at",                                                               :null => false
    t.datetime "updated_at",                                                               :null => false
    t.integer  "account_id",                                                               :null => false
  end

  add_index "taxes", ["account_id"], :name => "index_taxes_on_account_id"

  create_table "users", :force => true do |t|
    t.string   "first_name",             :limit => 40
    t.string   "last_name",              :limit => 40,                    :null => false
    t.string   "email",                                :default => "",    :null => false
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.boolean  "active",                               :default => true,  :null => false
    t.boolean  "administrator",                        :default => true,  :null => false
    t.boolean  "dispensing_optician",                  :default => true,  :null => false
    t.string   "encrypted_password",                   :default => "",    :null => false
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
    t.integer  "account_id",                                              :null => false
    t.boolean  "super_administrator",                  :default => false, :null => false
  end

  add_index "users", ["account_id"], :name => "index_users_on_account_id"
  add_index "users", ["email"], :name => "index_employees_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_employees_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_employees_on_unlock_token", :unique => true

end
