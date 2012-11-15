class LinkEmployeeToPersonalTitle < ActiveRecord::Migration
  def up
	change_table :employees do |t|
		t.references :personal_title
	end
    remove_column :employees, :title
  end

  def down
    remove_column :employees, :personal_title
	add_column :employees, :title, :limit => 10
  end
end
