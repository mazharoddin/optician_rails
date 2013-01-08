class CreateDispensings < ActiveRecord::Migration
  def up
    create_table :prescriptions do |t|
	  t.string :type, :limit => 100
      t.references :patient
      t.references :optometrist
	  t.references :prescription
      t.date :rx_date
      t.date :expiry_date
      t.string :description, :limit => 80
      t.text :notes
      t.decimal :od_sphere, :precision => 10, :scale => 2
      t.decimal :od_cylinder, :precision => 10, :scale => 2
      t.decimal :od_axis, :precision => 10, :scale => 0
      t.decimal :od_add, :precision => 10, :scale => 2
      t.string :od_base_curve, :limit => 20
      t.string :od_diameter, :limit => 20
      t.string :od_prism1, :limit => 20
      t.string :od_base1, :limit => 20
      t.string :od_prism2, :limit => 20
      t.string :od_base2, :limit => 20
      t.references :od_brand
      t.decimal :os_sphere, :precision => 10, :scale => 2
      t.decimal :os_cylinder, :precision => 10, :scale => 2
      t.decimal :os_axis, :precision => 10, :scale => 0
      t.decimal :os_add, :precision => 10, :scale => 2
      t.string :os_base_curve, :limit => 20
      t.string :os_diameter,:limit => 20
      t.string :os_prism1, :limit => 20
      t.string :os_base1, :limit => 20
      t.string :os_prism2, :limit => 20
      t.string :os_base2, :limit => 20
      t.references :os_brand

      t.timestamps
    end
    add_index :prescriptions, :patient_id
    add_index :prescriptions, :optometrist_id
	add_index :prescriptions, :prescription_id
    add_index :prescriptions, :od_brand_id
    add_index :prescriptions, :os_brand_id

    create_table :dispensing do |t|
	  t.string :type, :limit => 100
      t.references :invoice
      t.references :patient
      t.references :optometrist
	  t.references :prescription
      t.date :rx_date
      t.date :expiry_date
      t.string :description, :limit => 80
      t.text :notes
      t.decimal :od_sphere, :precision => 10, :scale => 2
      t.decimal :od_cylinder, :precision => 10, :scale => 2
      t.decimal :od_axis, :precision => 10, :scale => 0
      t.decimal :od_add, :precision => 10, :scale => 2
      t.string :od_base_curve, :limit => 20
      t.string :od_diameter, :limit => 20
      t.string :od_prism1, :limit => 20
      t.string :od_base1, :limit => 20
      t.string :od_prism2, :limit => 20
      t.string :od_base2, :limit => 20
      t.references :od_brand
      t.decimal :os_sphere, :precision => 10, :scale => 2
      t.decimal :os_cylinder, :precision => 10, :scale => 2
      t.decimal :os_axis, :precision => 10, :scale => 0
      t.decimal :os_add, :precision => 10, :scale => 2
      t.string :os_base_curve, :limit => 20
      t.string :os_diameter,:limit => 20
      t.string :os_prism1, :limit => 20
      t.string :os_base1, :limit => 20
      t.string :os_prism2, :limit => 20
      t.string :os_base2, :limit => 20
      t.references :os_brand

      t.timestamps
    end
    add_index :dispensing, :invoice_id
    add_index :dispensing, :patient_id
    add_index :dispensing, :optometrist_id
	add_index :dispensing, :prescription_id
    add_index :dispensing, :od_brand_id
    add_index :dispensing, :os_brand_id
	
	drop_table :contacts_prescriptions
	drop_table :glasses_prescriptions
  end
  
	def down
		drop_table :dispensing
		drop_table :prescriptions

		create_table "glasses_prescriptions", :force => true do |t|
			t.integer  "patient_id"
			t.integer  "optometrist_id"
			t.date     "rx_date"
			t.date     "expiry_date"
			t.string   "description",    :limit => 80
			t.text     "notes"
			t.decimal  "od_sphere",                    :precision => 10, :scale => 2
			t.decimal  "od_cylinder",                  :precision => 10, :scale => 2
			t.decimal  "od_axis",                      :precision => 10, :scale => 0
			t.decimal  "od_add",                       :precision => 10, :scale => 2
			t.string   "od_prism1",      :limit => 20
			t.string   "od_base1",       :limit => 20
			t.string   "od_prism2",      :limit => 20
			t.string   "od_base2",       :limit => 20
			t.decimal  "os_sphere",                    :precision => 10, :scale => 2
			t.decimal  "os_cylinder",                  :precision => 10, :scale => 2
			t.decimal  "os_axis",                      :precision => 10, :scale => 0
			t.decimal  "os_add",                       :precision => 10, :scale => 2
			t.string   "os_prism1",      :limit => 20
			t.string   "os_base1",       :limit => 20
			t.string   "os_prism2",      :limit => 20
			t.string   "os_base2",       :limit => 20
			t.datetime "created_at",                                                  :null => false
			t.datetime "updated_at",                                                  :null => false
		end

		add_index "glasses_prescriptions", ["optometrist_id"], :name => "index_spectacles_prescriptions_on_optometrist_id"
		add_index "glasses_prescriptions", ["patient_id"], :name => "index_spectacles_prescriptions_on_patient_id"

		create_table "contacts_prescriptions", :force => true do |t|
			t.integer  "patient_id"
			t.integer  "optometrist_id"
			t.date     "rx_date"
			t.date     "expiry_date"
			t.string   "description",    :limit => 80
			t.text     "notes"
			t.decimal  "od_sphere",                    :precision => 10, :scale => 2
			t.decimal  "od_cylinder",                  :precision => 10, :scale => 2
			t.decimal  "od_axis",                      :precision => 10, :scale => 0
			t.decimal  "od_add",                       :precision => 10, :scale => 2
			t.string   "od_base_curve",  :limit => 20
			t.string   "od_diameter",    :limit => 20
			t.integer  "od_brand_id"
			t.decimal  "os_sphere",                    :precision => 10, :scale => 2
			t.decimal  "os_cylinder",                  :precision => 10, :scale => 2
			t.decimal  "os_axis",                      :precision => 10, :scale => 0
			t.decimal  "os_add",                       :precision => 10, :scale => 2
			t.string   "os_base_curve",  :limit => 20
			t.string   "os_diameter",    :limit => 20
			t.integer  "os_brand_id"
			t.datetime "created_at",                                                  :null => false
			t.datetime "updated_at",                                                  :null => false
		end

		add_index "contacts_prescriptions", ["optometrist_id"], :name => "index_contacts_prescriptions_on_optometrist_id"
		add_index "contacts_prescriptions", ["patient_id"], :name => "index_contacts_prescriptions_on_patient_id"
	end
end
