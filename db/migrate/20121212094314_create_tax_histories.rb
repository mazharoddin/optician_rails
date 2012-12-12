class CreateTaxHistories < ActiveRecord::Migration
  def up
    create_table :tax_histories do |t|
      t.references :tax
      t.string :name, :limit => 40
      t.float :rate
      t.timestamp :start_at
      t.timestamp :end_at

      t.timestamps
    end
    add_index :tax_histories, :tax_id
	remove_column :taxes, :start_at
	remove_column :taxes, :end_at	
  end
  
  def down
    drop_table :tax_histories
	change table :taxes do |t|
	  t.date :start_at
	  t.date :end_at
	end
  end
end
