class CreateSpectaclesPrescriptions < ActiveRecord::Migration
  def change
    create_table :spectacles_prescriptions do |t|
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
      t.string :od_prism1, :limit => 20
      t.string :od_base1, :limit => 20
      t.string :od_prism2, :limit => 20
      t.string :od_base2, :limit => 20
      t.decimal :os_sphere
      t.decimal :os_cylinder
      t.decimal :os_axis
      t.decimal :os_add
      t.string :os_prism1, :limit => 20
      t.string :os_base1, :limit => 20
      t.string :os_prism2, :limit => 20
      t.string :os_base2, :limit => 20

      t.timestamps
    end
    add_index :spectacles_prescriptions, :patient_id
    add_index :spectacles_prescriptions, :optometrist_id
  end
end
