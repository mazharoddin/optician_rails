class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :title, :limit => 10
      t.string :first_name, :limit => 40
      t.string :last_name, :limit => 40
      t.string :preferred_name, :limit => 40
      t.string :email, :limit => 255
      t.string :password, :limit => 40

      t.timestamps
    end
  end
end
