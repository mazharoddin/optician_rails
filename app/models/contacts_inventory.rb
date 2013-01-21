class ContactsInventory < Inventory
  validates :lens_material_id, :presence => true
  validates :manufacturer_id, :presence => true
  validates :model, :presence => true
end
