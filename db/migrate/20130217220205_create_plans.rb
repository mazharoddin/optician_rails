class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name, :limit => 60, :null => false
      t.boolean :active, :null => false, :default => true
      t.boolean :inventory, :null => false, :default => false
      t.boolean :multistore, :null => false, :default => false
      t.decimal :price, :precision => 10, :scale => 2, :null => false

      t.timestamps
    end
	add_index :plans, [:name], :unique => true
	add_column :accounts, :plan_id, :integer, :null => false
  end
end
