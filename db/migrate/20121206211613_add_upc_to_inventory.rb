class AddUpcToInventory < ActiveRecord::Migration
  def up
    add_column :inventory, :upc, :string, :limit => 40
  end

  def down
    remove_column :inventory, :upc
  end
end
