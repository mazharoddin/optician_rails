class AddLockedDateToInvoices < ActiveRecord::Migration
  def change
	add_column :invoices, :locked_date, :datetime, :null => true
  end
end
