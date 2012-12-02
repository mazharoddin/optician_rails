class RenameSpectaclesPrescription < ActiveRecord::Migration
  def up
    rename_table :spectacles_prescriptions, :glasses_prescriptions
  end

  def down
    rename_table :glasses_prescriptions, :spectacles_prescriptions
  end
end
