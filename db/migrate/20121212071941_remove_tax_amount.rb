class RemoveTaxAmount < ActiveRecord::Migration
  def up
	remove_column :taxes, :amount
  end

  def down
	add_column :taxes, :amount, :decimal
  end
end
