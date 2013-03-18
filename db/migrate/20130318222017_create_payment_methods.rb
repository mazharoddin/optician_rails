class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.string :name, :null => false, :limit => 20
      t.integer :account_id, :null => false
      t.boolean :active, :default => true, :null => false

      t.timestamps
    end
	
	add_index :payment_methods, :account_id, :unique => false
	add_index :payment_methods, [:account_id, :name], :unique => true
  end
end
