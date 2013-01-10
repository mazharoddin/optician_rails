class CreateUsers < ActiveRecord::Migration
  def up
    rename_table :employees, :users
  end

  def down
    rename_table :users, :employees
  end

end