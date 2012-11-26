class CreateTaxClasses < ActiveRecord::Migration
  def change
    create_table :tax_classes do |t|
      t.string :name, :limit => 40
      t.references :tax_a
      t.references :tax_b
      t.boolean :tax_b_applies_tax_a

      t.timestamps
    end
    add_index :tax_classes, :tax_a_id
    add_index :tax_classes, :tax_b_id
  end
end
