class Inventory < ActiveRecord::Base
  belongs_to :manufacturer, :class_name => 'Company'
  belongs_to :supplier, :class_name => 'Company'
  belongs_to :tax_a, :class_name => 'Tax'
  belongs_to :tax_b, :class_name => 'Tax'
  belongs_to :lens_material
  belongs_to :lens_type
  
  has_and_belongs_to_many :lens_coating
  
  attr_accessible :cost_price, :current_retail_price, :description, :regular_retail_price, :stock_available, :stock_reorder, :sugested_retail_price, :supplier_code, :type, :manufacturer_id, :supplier_id, :tax_a_id, :tax_b_id, :model, :colour, :eyesize, :bridge, :template, :appointment_type, :lens_material_id, :lens_type_id, :lens_coating_ids, :active, :upc, :track_inventory, :duration
  
  validates :description, :presence => true, :uniqueness => true
  validates :regular_retail_price, :presence => true

  def to_s
	return description
  end
end
