class AddServiceInventoryColumns < ActiveRecord::Migration
  def up
    change_table :inventory do |t|
	  t.boolean :appointment_type
	end
  end

  def down
	remove_column :inventory, :appointment_type
  end
end
