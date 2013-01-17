class CreateLensCoatingHistories < ActiveRecord::Migration
  def change
    create_table :lens_coating_histories do |t|
      t.references :lens_coating
      t.string :name, :limit => 60
      t.boolean :active, :default => true, :null => false
      t.datetime :start_at, :null => false
      t.datetime :end_at

      t.timestamps
    end
    add_index :lens_coating_histories, :lens_coating_id
  end
end
