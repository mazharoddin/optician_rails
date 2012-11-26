class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :type, :limit => 60
      t.string :name

      t.timestamps
    end
  end
end
