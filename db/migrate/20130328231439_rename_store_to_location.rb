class RenameStoreToLocation < ActiveRecord::Migration
  def up
	rename_table :stores, :locations
	rename_column :plans, :multistore, :multilocation
  end

  def down
	rename_column :plans, :multilocation, :multistore
	rename_table :locations, :stores
  end
end
