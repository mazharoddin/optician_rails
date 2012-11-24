class CreateContactsPrescriptions < ActiveRecord::Migration
  def change
    create_table :contacts_prescriptions do |t|
      t.references :patient
      t.references :optometrist
      t.date :rx_date
      t.date :expiry_date
      t.string :description, :limit => 80
      t.text :notes
      t.decimal :od_sphere
      t.decimal :od_cylinder
      t.decimal :od_axis
      t.decimal :od_add
      t.string :od_base_curve, :limit => 20
      t.string :od_diameter, :limit => 20
      t.references :od_brand
      t.decimal :os_sphere
      t.decimal :os_cylinder
      t.decimal :os_axis
      t.decimal :os_add
      t.string :os_base_curve, :limit => 20
      t.string :os_diameter, :limit => 20
      t.references :os_brand

      t.timestamps
    end
    add_index :contacts_prescriptions, :patient_id
    add_index :contacts_prescriptions, :optometrist_id
  end
end
