class ServicesInventory < Inventory
  validates :duration, :presence => true, :if => :appointment_type
end
