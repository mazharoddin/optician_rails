class ServicesInventory < Inventory
  # attr_accessible :title, :body
  validates :duration, :presence => true, :if => :appointment_type
end
