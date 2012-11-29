class CreateInventory < ActiveRecord::Migration
  def change
    create_table :inventory do |t|
      t.string :type, :limit => 100
      t.string :description, :limit => 80
      t.references :manufacturer
      t.references :supplier
      t.string :supplier_code, :limit => 80
      t.decimal :cost_price
      t.decimal :sugested_retail_price
      t.decimal :regular_retail_price
      t.decimal :current_retail_price
      t.references :tax_class
      t.integer :stock_available
      t.integer :stock_reorder

      t.timestamps
    end
    add_index :inventory, :manufacturer_id
    add_index :inventory, :supplier_id
    add_index :inventory, :tax_class_id
  end
end
