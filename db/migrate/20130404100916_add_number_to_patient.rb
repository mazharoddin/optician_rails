class AddNumberToPatient < ActiveRecord::Migration
  def up
    add_column :patients, :number, :integer, :null => false
	execute <<-SQL
	  UPDATE patients SET number = id
	SQL
	add_index :patients, [:account_id, :number], :unique => true
  end
  
  def down
    remove_index :patients, [:account_id, :number]
	remove_column :patients, :number
  end
end
