class Inventory < ActiveRecord::Base
  belongs_to :manufacturer
  belongs_to :supplier
  belongs_to :tax_class
  attr_accessible :cost_price, :current_retail_price, :description, :regular_retail_price, :stock_available, :stock_reorder, :sugested_retail_price, :supplier_code, :type
end
