class AddTaxesToInventory < ActiveRecord::Migration
  def up
    change_table :inventory do |t|
      t.references :tax_a
      t.references :tax_b
	end
	remove_column :inventory, :tax_class_id
  end
  
  def down
    change_table :inventory do |t|
      t.references :tax_class
	end
	remove_column :inventory, :tax_a_id
	remove_column :inventory, :tax_b_id
  end
end
