class CreateLensTypeHistories < ActiveRecord::Migration
  def change
    create_table :lens_type_histories do |t|
      t.references :lens_type
      t.string :name, :limit => 60
      t.boolean :active, :default => true, :null => false
      t.datetime :start_at, :null => false
      t.datetime :end_at

      t.timestamps
    end
    add_index :lens_type_histories, :lens_type_id
  end
end
