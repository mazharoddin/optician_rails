class AddVoidDateToInvoices < ActiveRecord::Migration
  def up
	add_column :invoices, :void_date, :datetime
	rename_column :invoices, :date, :invoice_date
  end

  def down
	drop_column :invoices, :void_date
	rename_column :invoices, :invoice_date, :date
  end
end
