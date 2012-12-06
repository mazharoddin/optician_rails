class AddTrackInventoryToInventory < ActiveRecord::Migration
  def up
    add_column :inventory, :track_inventory, :boolean, :null => false, :default => true
  end

  def down
    remove_column :inventory, :track_inventory
  end
end
