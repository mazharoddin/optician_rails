class Inventory < ActiveRecord::Base
  belongs_to :manufacturer, :class_name => 'Company'
  belongs_to :supplier, :class_name => 'Company'
  belongs_to :tax_class
  attr_accessible :cost_price, :current_retail_price, :description, :regular_retail_price, :stock_available, :stock_reorder, :sugested_retail_price, :supplier_code, :type, :manufacturer_id, :supplier_id, :tax_class_id, :model, :colour, :eyesize, :bridge, :template, :appointment_type
  
  def to_s
	return description
  end
end
