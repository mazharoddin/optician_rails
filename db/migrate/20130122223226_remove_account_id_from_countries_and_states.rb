class RemoveAccountIdFromCountriesAndStates < ActiveRecord::Migration
  def up
    remove_index :countries, :name => :index_countries_on_account_id
    remove_column :countries, :account_id
    remove_index :states, :name => :index_states_on_account_id
    remove_column :states, :account_id
  end

  def down
    add_column :countries, :account_id, :integer, :null => false
    add_index :countries, :account_id
    add_column :states, :account_id, :integer, :null => false
    add_index :states, :account_id
  end
end
