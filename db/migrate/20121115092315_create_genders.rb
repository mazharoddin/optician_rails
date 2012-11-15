class CreateGenders < ActiveRecord::Migration
  def change
    create_table :genders do |t|
      t.string :name, :limit => 10

      t.timestamps
    end
  end
end
