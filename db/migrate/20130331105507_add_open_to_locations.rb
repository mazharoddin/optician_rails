class AddOpenToLocations < ActiveRecord::Migration
  def up
    add_column :locations, :open_monday, :boolean, :null => false, :default => true
    add_column :locations, :open_tuesday, :boolean, :null => false, :default => true
    add_column :locations, :open_wednesday, :boolean, :null => false, :default => true
    add_column :locations, :open_thursday, :boolean, :null => false, :default => true
    add_column :locations, :open_friday, :boolean, :null => false, :default => true
    add_column :locations, :open_saturday, :boolean, :null => false, :default => true
    add_column :locations, :open_sunday, :boolean, :null => false, :default => true
  end

  def down
    remove_column :locations, :open_monday
    remove_column :locations, :open_tuesday
    remove_column :locations, :open_wednesday
    remove_column :locations, :open_thursday
    remove_column :locations, :open_friday
    remove_column :locations, :open_saturday
    remove_column :locations, :open_sunday
  end
end
