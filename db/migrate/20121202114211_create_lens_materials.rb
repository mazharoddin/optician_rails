class CreateLensMaterials < ActiveRecord::Migration
  def change
    create_table :lens_materials do |t|
      t.string :name, :limit => 60

      t.timestamps
    end
  end
end
