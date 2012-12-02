class AddFrameInventoryColumns < ActiveRecord::Migration
  def up
    change_table :inventory do |t|
	  t.string :model, :limit => 60
	  t.string :colour, :limit => 30
	  t.string :eyesize, :limit => 10
	  t.string :bridge, :limit => 10
	  t.string :template, :limit => 10
	end
  end

  def down
    remove_column :inventory, :model
    remove_column :inventory, :colour
    remove_column :inventory, :eyesize
    remove_column :inventory, :bridge
    remove_column :inventory, :template
  end
end
