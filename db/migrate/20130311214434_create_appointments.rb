class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :account, :null => false
      t.references :patient, :null => false
      t.references :optometrist, :null => false
      t.references :inventory, :null => false
      t.datetime :start_at, :null => false
      t.integer :duration, :null => false

      t.timestamps
    end
    add_index :appointments, :account_id
    add_index :appointments, :patient_id
    add_index :appointments, :optometrist_id
    add_index :appointments, :inventory_id
  end
end
