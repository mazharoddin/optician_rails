class DbCleanup < ActiveRecord::Migration
  def up
    change_column :accounts, :name, :string, :limit => 80, :null => false
    change_column :accounts, :subdomain, :string, :limit => 69, :null => false
    change_column :accounts, :active, :boolean, :null => false, :default => true
    change_column :brands, :name, :string, :limit => 60, :null => false
    change_column :brand_histories, :name, :string, :limit => 60, :null => false
    change_column :companies, :name, :string, :limit => 60, :null => false
    change_column :countries, :name, :string, :limit => 60, :null => false
    change_column :countries, :active, :boolean, :null => false, :default => true
    change_column :employment_types, :name, :string, :limit => 60, :null => false
    change_column :genders, :name, :string, :limit => 60, :null => false
    change_column :guardian_relationships, :name, :string, :limit => 60, :null => false
    change_column :inventory, :description, :string, :limit => 100, :null => false
    change_column :items, :description, :string, :limit => 255, :null => false
    change_column :items, :discount, :decimal, :precision => 10, :scale => 2, :null => false
    change_column :items, :qty, :decimal, :precision => 10, :scale => 2, :null => false
    change_column :items, :unit_price, :decimal, :precision => 10, :scale => 2, :null => false
    change_column :items, :total_price, :decimal, :precision => 10, :scale => 2, :null => false
    change_column :invoices, :total, :decimal, :precision => 10, :scale => 2, :null => false, :default => 0.00
    change_column :invoices, :paid, :decimal, :precision => 10, :scale => 2, :null => false, :default => 0.00
    change_column :invoices, :balance, :decimal, :precision => 10, :scale => 2, :null => false, :default => 0.00
    change_column :lens_coatings, :name, :string, :limit => 60, :null => false
    change_column :lens_coating_histories, :name, :string, :limit => 60, :null => false
    change_column :lens_materials, :name, :string, :limit => 60, :null => false
    change_column :lens_material_histories, :name, :string, :limit => 60, :null => false
    change_column :lens_types, :name, :string, :limit => 60, :null => false
    change_column :lens_type_histories, :name, :string, :limit => 60, :null => false
    change_column :optometrists, :last_name, :string, :limit => 40, :null => false
    change_column :patients, :last_name, :string, :limit => 40, :null => false
    change_column :personal_titles, :title, :string, :limit => 20, :null => false
    change_column :personal_title_histories, :personal_title_id, :integer, :null => false
    change_column :personal_title_histories, :title, :string, :limit => 20, :null => false
    change_column :states, :name, :string, :limit => 60, :null => false
    change_column :states, :short_name, :string, :limit => 60, :null => false
    change_column :states, :country_id, :integer, :null => false
	change_column :stores, :name, :string, :limit => 60, :null => false
	change_column :taxes, :name, :string, :limit => 40, :null => false
	change_column :taxes, :rate, :decimal, :precision => 10, :scale => 4, :null => false, :default => '0.0000'
	change_column :tax_histories, :tax_id, :integer, :null => false
	change_column :tax_histories, :name, :string, :limit => 40, :null => false
	change_column :tax_histories, :rate, :decimal, :precision => 10, :scale => 4, :null => false, :default => '0.0000'
	change_column :users, :last_name, :string, :limit => 40, :null => false
	change_column :users, :active, :boolean, :null => false, :default => true
	change_column :users, :administrator, :boolean, :null => false, :default => true
	change_column :users, :dispensing_optician, :boolean, :null => false, :default => true
  end
  
  def down
  end
end
