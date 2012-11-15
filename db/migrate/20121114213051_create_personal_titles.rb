class CreatePersonalTitles < ActiveRecord::Migration
  def change
    create_table :personal_titles do |t|
      t.string :title, :limit => 20

      t.timestamps
    end
  end
end
