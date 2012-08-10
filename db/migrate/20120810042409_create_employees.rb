class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :preferred_name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
