class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name, :limit => 60
      t.string :email, :limit => 255
      t.string :url, :limit => 255
      t.string :phone, :limit => 30
      t.string :fax, :limit => 30
      t.string :address, :limit => 255
      t.string :city, :limit => 60
      t.references :state
      t.string :postal_code, :limit => 20
      t.references :country
      t.time :monday_open
      t.time :monday_close
      t.time :tuesday_open
      t.time :tuesday_close
      t.time :wednesday_open
      t.time :wednesday_close
      t.time :thursday_open
      t.time :thursday_close
      t.time :friday_open
      t.time :friday_close
      t.time :saturday_open
      t.time :saturday_close
      t.time :sunday_open
      t.time :sunday_close

      t.timestamps
    end
    add_index :stores, :state_id
    add_index :stores, :country_id
  end
end
