class AddPermissionsToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :active, :boolean
    add_column :employees, :administrator, :boolean
    add_column :employees, :dispensing_optician, :boolean
	remove_column :employees, :preferred_name
  end
end
