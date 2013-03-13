class Appointment < ActiveRecord::Base
  attr_accessible :account_id, :duration, :inventory_id, :optometrist_id, :patient_id, :start_at

  belongs_to :account
  belongs_to :inventory
  belongs_to :optometrist
  belongs_to :patient
  
  validates :account_id, :presence => true
  validates :duration, :presence => true, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :inventory_id, :presence => true
  validates :optometrist_id, :presence => true
  validates :patient_id, :presence => true
  validates :start_at, :presence => true
end
