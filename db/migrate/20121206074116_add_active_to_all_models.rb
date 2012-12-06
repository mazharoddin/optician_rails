class AddActiveToAllModels < ActiveRecord::Migration
  def up
    add_column :brands, :active, :boolean, :null => false, :default => true
    add_column :companies, :active, :boolean, :null => false, :default => true
    add_column :employment_types, :active, :boolean, :null => false, :default => true
    add_column :genders, :active, :boolean, :null => false, :default => true
    add_column :guardian_relationships, :active, :boolean, :null => false, :default => true
    add_column :lens_coatings, :active, :boolean, :null => false, :default => true
    add_column :lens_materials, :active, :boolean, :null => false, :default => true
    add_column :lens_types, :active, :boolean, :null => false, :default => true
    add_column :optometrists, :active, :boolean, :null => false, :default => true
    add_column :personal_titles, :active, :boolean, :null => false, :default => true
    add_column :states, :active, :boolean, :null => false, :default => true
    add_column :stores, :active, :boolean, :null => false, :default => true
    add_column :taxes, :active, :boolean, :null => false, :default => true
    add_column :tax_classes, :active, :boolean, :null => false, :default => true
	rename_column :countries, :enabled, :active
  end

  def down
	rename_column :countries, :active, :enabled
    remove_column :brands, :active
    remove_column :companies, :active
    remove_column :employment_types
    remove_column :genders, :active
    remove_column :guardian_relationships, :active
    remove_column :lens_coatings, :active
    remove_column :lens_materials, :active
    remove_column :lens_types, :active
    remove_column :optometrists, :active
    remove_column :personal_titles, :active
    remove_column :states, :active
    remove_column :stores, :active
    remove_column :taxes, :active
    remove_column :tax_classes, :active
  end
end
