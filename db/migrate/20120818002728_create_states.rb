class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name, :limit => 60
	  t.string :short_name, :limit => 10
      t.references :country

      t.timestamps
    end
    add_index :states, :country_id
  end
end
