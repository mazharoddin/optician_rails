class MakeSevenModelGlobal < ActiveRecord::Migration
  def up
    remove_column :employment_types, :account_id
    remove_column :genders, :account_id
    remove_column :guardian_relationships, :account_id
    remove_column :lens_coatings, :account_id
	drop_table :lens_coating_histories
	remove_column :lens_materials, :account_id
	drop_table :lens_material_histories
	remove_column :lens_types, :account_id
	drop_table :lens_type_histories
	remove_column :personal_titles, :account_id
	drop_table :personal_title_histories
  end

  def down
  end
end
