class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name, :limit => 60

      t.timestamps
    end
  end
end
