class AddAccountToAllTables < ActiveRecord::Migration
  def change
    add_column :brands, :account_id, :integer, :null => false
    add_index :brands, :account_id
    add_column :brand_histories, :account_id, :integer, :null => false
    add_index :brand_histories, :account_id
    add_column :companies, :account_id, :integer, :null => false
    add_index :companies, :account_id
    add_column :countries, :account_id, :integer, :null => false
    add_index :countries, :account_id
    add_column :dispensing, :account_id, :integer, :null => false
    add_index :dispensing, :account_id
    add_column :employment_types, :account_id, :integer, :null => false
    add_index :employment_types, :account_id
    add_column :genders, :account_id, :integer, :null => false
    add_index :genders, :account_id
    add_column :guardian_relationships, :account_id, :integer, :null => false
    add_index :guardian_relationships, :account_id
    add_column :inventory, :account_id, :integer, :null => false
    add_index :inventory, :account_id
    add_column :inventory_lens_coatings, :account_id, :integer, :null => false
    add_index :inventory_lens_coatings, :account_id
    add_column :invoices, :account_id, :integer, :null => false
    add_index :invoices, :account_id
    add_column :items, :account_id, :integer, :null => false
    add_index :items, :account_id
    add_column :lens_coatings, :account_id, :integer, :null => false
    add_index :lens_coatings, :account_id
    add_column :lens_coating_histories, :account_id, :integer, :null => false
    add_index :lens_coating_histories, :account_id
    add_column :lens_materials, :account_id, :integer, :null => false
    add_index :lens_materials, :account_id
    add_column :lens_material_histories, :account_id, :integer, :null => false
    add_index :lens_material_histories, :account_id
    add_column :lens_types, :account_id, :integer, :null => false
    add_index :lens_types, :account_id
    add_column :lens_type_histories, :account_id, :integer, :null => false
    add_index :lens_type_histories, :account_id
    add_column :optometrists, :account_id, :integer, :null => false
    add_index :optometrists, :account_id
    add_column :patients, :account_id, :integer, :null => false
    add_index :patients, :account_id
    add_column :personal_titles, :account_id, :integer, :null => false
    add_index :personal_titles, :account_id
    add_column :personal_title_histories, :account_id, :integer, :null => false
    add_index :personal_title_histories, :account_id
    add_column :prescriptions, :account_id, :integer, :null => false
    add_index :prescriptions, :account_id
    add_column :states, :account_id, :integer, :null => false
    add_index :states, :account_id
    add_column :stores, :account_id, :integer, :null => false
    add_index :stores, :account_id
    add_column :taxes, :account_id, :integer, :null => false
    add_index :taxes, :account_id
    add_column :tax_histories, :account_id, :integer, :null => false
    add_index :tax_histories, :account_id
    add_column :users, :account_id, :integer, :null => false
    add_index :users, :account_id
  end
end
