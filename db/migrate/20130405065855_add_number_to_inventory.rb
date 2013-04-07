class AddNumberToInventory < ActiveRecord::Migration
  def up
    add_column :inventory, :number, :integer, :null => false
	execute <<-SQL
	  UPDATE inventory SET number = id
	SQL
	add_index :inventory, [:account_id, :number], :unique => true
  end
  
  def down
    remove_index :inventory, [:account_id, :number]
	remove_column :inventory, :number
  end
end
