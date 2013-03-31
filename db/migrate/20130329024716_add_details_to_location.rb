class AddDetailsToLocation < ActiveRecord::Migration
  def up
	add_column :locations, :company_name, :string, :limit => 80, :null => true
	add_column :locations, :contact_person_id, :integer, :null => true
	add_attachment :locations, :logo
  end
  
  def down
    remove_column :locations, :company_name
	remove_column :locations, :contact_person_id
	remove_attachment :locations, :logo
  end
end
