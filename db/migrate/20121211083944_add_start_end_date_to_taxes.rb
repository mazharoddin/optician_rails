class AddStartEndDateToTaxes < ActiveRecord::Migration
  def up
    change_table :taxes do |t|
	  t.date :start_at, :null => false
	  t.date :end_at
	 end
	remove_column :taxes, :active
  end
  
  def down
	remove_column :taxes, :start_at
	remove_column :taxes, :end_at
	add_column :taxes, :active, :boolean, :default => true
  end
end
