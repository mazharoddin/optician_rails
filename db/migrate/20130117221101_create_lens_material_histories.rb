class CreateLensMaterialHistories < ActiveRecord::Migration
  def change
    create_table :lens_material_histories do |t|
      t.references :lens_material
      t.string :name, :limit => 60
      t.boolean :active, :default => true, :null => false
      t.datetime :start_at, :null => false
      t.datetime :end_at

      t.timestamps
    end
    add_index :lens_material_histories, :lens_material_id
  end
end
