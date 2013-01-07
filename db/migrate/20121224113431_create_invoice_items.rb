class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.string :description
      t.decimal :unit_price
      t.decimal :discount
      t.decimal :qty
      t.references :tax_a
      t.references :tax_b
      t.decimal :tax_a_amount
      t.decimal :tax_b_amount
      t.decimal :total_price
      t.references :inventory

      t.timestamps
    end
    add_index :invoice_items, :tax_a_id
    add_index :invoice_items, :tax_b_id
    add_index :invoice_items, :inventory_id
  end
end
