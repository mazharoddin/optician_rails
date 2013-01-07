class RenameInvoiceItemsToItems < ActiveRecord::Migration
  def up
	rename_table :invoice_items, :items
  end

  def down
	rename_table :items, :invoice_items
  end
end
