class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.references :personal_title
      t.string :last_name, :limit => 40
      t.string :first_name, :limit => 40
      t.string :preferred_name, :limit => 40
      t.references :gender
      t.date :birthday
      t.string :home_phone, :limit => 20
      t.string :work_phone, :limit => 20
      t.string :work_ext, :limit => 5
      t.string :mobile_phone, :limit => 20
      t.string :email, :limit => 255
      t.string :home_address, :limit => 255
      t.string :home_city, :limit => 80
      t.references :home_state
      t.string :home_postal_code, :limit => 20
      t.references :home_country
      t.string :postal_address, :limit => 255
      t.string :postal_city, :limit => 80
      t.references :postal_state
      t.string :postal_postal_code, :limit => 20
      t.references :postal_country
      t.text :note
      t.references :optometrist
      t.boolean :smoker
      t.text :alergies
      t.text :medical_other
      t.references :employment_type
      t.string :occupation, :limit => 80
      t.string :guardian_name, :limit => 80
      t.references :guardian_relationship
      t.string :guardian_phone, :limit => 20
      t.string :guardian_alt_phone, :limit => 20

      t.timestamps
    end
    add_index :patients, :personal_title_id
    add_index :patients, :gender_id
    add_index :patients, :home_state_id
    add_index :patients, :home_country_id
    add_index :patients, :postal_state_id
    add_index :patients, :postal_country_id
    add_index :patients, :optometrist_id
    add_index :patients, :employment_type_id
    add_index :patients, :guardian_relationship_id
  end
end
