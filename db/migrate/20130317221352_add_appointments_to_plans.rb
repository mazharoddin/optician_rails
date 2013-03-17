class AddAppointmentsToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :appointments, :boolean, :null => false, :default => false
  end
end
