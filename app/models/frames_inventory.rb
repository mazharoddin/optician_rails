class FramesInventory < Inventory
  # attr_accessible :title, :body
  validates :model, :presence => true
  validates :colour, :presence => true
  validates :eyesize, :presence => true
  validates :bridge, :presence => true
  validates :template, :presence => true
end
