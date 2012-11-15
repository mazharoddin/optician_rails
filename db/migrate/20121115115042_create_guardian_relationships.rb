class CreateGuardianRelationships < ActiveRecord::Migration
  def change
    create_table :guardian_relationships do |t|
      t.string :name, :limit => 40

      t.timestamps
    end
  end
end
