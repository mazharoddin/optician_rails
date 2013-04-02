class CreateLensCoatingsInventory < ActiveRecord::Migration
  def change
    create_table :lens_coatings_inventory do |t|

      t.timestamps
    end
  end
end
