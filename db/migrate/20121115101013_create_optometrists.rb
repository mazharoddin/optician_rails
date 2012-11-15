class CreateOptometrists < ActiveRecord::Migration
  def change
    create_table :optometrists do |t|
      t.references :personal_title
      t.string :last_name, :limit => 40
      t.string :first_name, :limit => 40
      t.string :business_name, :limit => 80
      t.string :email, :limit => 255
      t.string :website, :limit => 255
      t.string :phone, :limit => 40
      t.string :fax, :limit => 40
      t.string :business_address, :limit => 255
      t.string :business_city, :limit => 80
      t.references :business_state
      t.string :business_postal_code, :limit => 20
      t.references :business_country

      t.timestamps
    end
    add_index :optometrists, :personal_title_id
    add_index :optometrists, :business_state_id
    add_index :optometrists, :business_country_id
  end
end
