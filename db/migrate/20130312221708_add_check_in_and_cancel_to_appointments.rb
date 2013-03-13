class AddCheckInAndCancelToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :checkin_at, :datetime
    add_column :appointments, :cancel_at, :datetime
  end
end
