class RemoveAccountIdFromInventoryLensCoatings < ActiveRecord::Migration
  def up
    remove_index :inventory_lens_coatings, :name => :index_inventory_lens_coatings_on_account_id
    remove_column :inventory_lens_coatings, :account_id
  end

  def down
    add_column :inventory_lens_coatings, :account_id, :integer, :null => false
    add_index :inventory_lens_coatings, :account_id
  end
end
