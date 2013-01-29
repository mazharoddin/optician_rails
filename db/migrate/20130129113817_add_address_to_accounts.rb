class AddAddressToAccounts < ActiveRecord::Migration
  def change
    change_table :accounts do |t|
      t.string   "url"
      t.string   "phone",           :limit => 30
      t.string   "fax",             :limit => 30
      t.string   "address"
      t.string   "city",            :limit => 60
      t.integer  "state_id"
      t.string   "postal_code",     :limit => 20
      t.integer  "country_id"
	end
  end
end
