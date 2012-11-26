class CreateTaxes < ActiveRecord::Migration
  def change
    create_table :taxes do |t|
      t.string :name, :limit => 40
      t.decimal :amount
      t.float :rate

      t.timestamps
    end
  end
end
