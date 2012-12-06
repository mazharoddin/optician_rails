class AddDurationToInventory < ActiveRecord::Migration
  def up
    add_column :inventory, :duration, :integer
  end

  def down
    remove_column :inventory, :duration
  end
end
