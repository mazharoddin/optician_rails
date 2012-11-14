class CreatePersonalTitles < ActiveRecord::Migration
  def change
    create_table :personal_titles do |t|
      t.string :title

      t.timestamps
    end
  end
end
