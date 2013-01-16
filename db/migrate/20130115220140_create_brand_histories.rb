class CreateBrandHistories < ActiveRecord::Migration
  def change
    create_table :brand_histories, :id => false do |t|
      t.integer :brand_id
      t.string   :name, :limit => 60
      t.boolean :active, :default => true, :null => false
      t.datetime :start_at, :null => false
      t.datetime :end_at

      t.timestamps
    end
  end
end