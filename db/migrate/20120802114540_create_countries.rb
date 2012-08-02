class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :abbreviation
      t.boolean :enabled

      t.timestamps
    end
  end
end
