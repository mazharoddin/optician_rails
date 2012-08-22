class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name, :limit => 60
      t.boolean :enabled

      t.timestamps
    end
  end
end
