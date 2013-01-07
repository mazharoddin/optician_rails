class AddInvoiceIdToInvoiceItems < ActiveRecord::Migration
  def up
	add_column :invoice_items, :invoice_id, :integer, :null => false
  end
  def down
  	remove_column :invoice_items, :invoice_id
  end
end
