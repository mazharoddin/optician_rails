class AddActiveToInventory < ActiveRecord::Migration
  def up
	change_table :inventory do |t|
	    t.boolean :active, :null => false, :default => true
	end
  end

  def down
	remove_column :inventory, :active
  end
end
