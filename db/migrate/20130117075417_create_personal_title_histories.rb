class CreatePersonalTitleHistories < ActiveRecord::Migration
  def change
    create_table :personal_title_histories do |t|
      t.references :personal_title
      t.string :title, :limit => 20
      t.boolean :active, :default => true, :null => false
      t.datetime :start_at, :null => false
      t.datetime :end_at

      t.timestamps
    end
    add_index :personal_title_histories, :personal_title_id
  end
end
