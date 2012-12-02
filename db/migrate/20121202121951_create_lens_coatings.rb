class CreateLensCoatings < ActiveRecord::Migration
  def change
    create_table :lens_coatings do |t|
      t.string :name

      t.timestamps
    end
  end
end
