class AddNextNumbers < ActiveRecord::Migration
  def up
    add_column :accounts, :next_patient_number, :integer, :null => false, :default => 1
    add_column :accounts, :next_inventory_number, :integer, :null => false, :default => 1
    add_column :accounts, :next_invoice_number, :integer, :null => false, :default => 1
    add_column :accounts, :next_payment_number, :integer, :null => false, :default => 1
    add_column :accounts, :next_dispensing_number, :integer, :null => false, :default => 1
  end

  def down
    remove_column :accounts, :next_patient_number
    remove_column :accounts, :next_inventory_number
    remove_column :accounts, :next_invoice_number
    remove_column :accounts, :next_payment_number
    remove_column :accounts, :next_dispensing_number
  end
end
