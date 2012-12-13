class DropTaxClasses < ActiveRecord::Migration
  def up
	drop_table :tax_classes
  end

  def down
	  create_table "tax_classes", :force => true do |t|
		t.string   "name",                :limit => 40
		t.integer  "tax_a_id"
		t.integer  "tax_b_id"
		t.boolean  "tax_b_applies_tax_a"
		t.datetime "created_at",                                          :null => false
		t.datetime "updated_at",                                          :null => false
		t.boolean  "active",                            :default => true, :null => false
	  end

	  add_index "tax_classes", ["tax_a_id"], :name => "index_tax_classes_on_tax_a_id"
	  add_index "tax_classes", ["tax_b_id"], :name => "index_tax_classes_on_tax_b_id"
  end
end
