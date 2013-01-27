class AddSuperAdmin < ActiveRecord::Migration
  def change
    add_column :users, :super_administrator, :boolean, :null => false, :default => false
  end

end
