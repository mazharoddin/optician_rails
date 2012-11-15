class CreateEmploymentTypes < ActiveRecord::Migration
  def change
    create_table :employment_types do |t|
      t.string :name, :limit => 40

      t.timestamps
    end
  end
end
