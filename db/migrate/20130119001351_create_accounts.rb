class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name, :limit => 80
      t.string :subdomain, :limit => 69
      t.boolean :active, :default => true

      t.timestamps
    end
	add_index :accounts, :name, :unique => true
	add_index :accounts, :subdomain, :unique => true
  end
end
