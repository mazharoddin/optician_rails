class AddLensInventoryColumns < ActiveRecord::Migration
  def up
    change_column :lens_coatings, :name, :string, :limit => 60
	change_table :inventory do |t|
	    t.integer :lens_material_id
	    t.integer :lens_type_id
	end
	create_table :inventory_lens_coatings do |t|
		t.integer :inventory_id
		t.integer :lens_coating_id
	end
  end

  def down
    drop_table :inventory
	remove_column :inventory, :lens_material_id
	remove_column :inventory, :lens_type_id
    change_column :lens_coatings, :string, :limit => 60
  end
end
