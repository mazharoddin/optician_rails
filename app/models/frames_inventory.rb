class FramesInventory < Inventory
  validates :bridge, :presence => true
  validates :colour, :presence => true
  validates :eyesize, :presence => true
  validates :manufacturer_id, :presence => true
  validates :model, :presence => true
  validates :template, :presence => true
end
