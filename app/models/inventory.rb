class Inventory < ActiveRecord::Base
  attr_accessible :active, :appointment_type, :bridge, :colour, :cost_price, :current_retail_price, :description, :duration, :eyesize, :lens_coating_ids, :lens_material_id, :lens_type_id, :manufacturer_id, :model, :regular_retail_price, :stock_available, :stock_reorder, :sugested_retail_price, :supplier_code, :supplier_id, :tax_a_id, :tax_b_id, :template, :track_inventory, :type, :upc

  belongs_to :manufacturer, :class_name => 'Company'
  belongs_to :supplier, :class_name => 'Company'
  belongs_to :tax_a, :class_name => 'Tax'
  belongs_to :tax_b, :class_name => 'Tax'
  belongs_to :lens_material
  belongs_to :lens_type
  belongs_to :account
  
  has_and_belongs_to_many :lens_coating
  
  validates :bridge, :length => { :maximum => 10 }
  validates :colour, :length => { :maximum => 30 }
  validates :cost_price, :numericality => { :greater_than_or_equal_to => 0 }, :allow_blank => true, :allow_nil => true
  validates :current_retail_price, :numericality => { :greater_than_or_equal_to => 0 }, :allow_blank => true, :allow_nil => true
  validates :description, :presence => true, :length => { :maximum => 80 } ,:uniqueness => true
  validates :duration, :numericality => { :greater_than_or_equal_to => 0 }, :allow_blank => true, :allow_nil => true
  validates :eyesize, :length => { :maximum => 10 }
  validates :model, :length => { :maximum => 60 }, :allow_blank => true, :allow_nil => true
  validates :regular_retail_price, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :stock_available, :numericality => true, :if => :track_inventory
  validates :stock_reorder, :numericality => { :greater_than_or_equal_to => 0 }, :allow_blank => true, :allow_nil => true, :if => :track_inventory
  validates :sugested_retail_price, :numericality => { :greater_than_or_equal_to => 0 }, :allow_blank => true, :allow_nil => true
  validates :supplier_code, :length => { :maximum => 80 }
  validates :template, :length => { :maximum => 10 }
  validates :upc, :length => { :maximum => 40 }

  default_scope { order("description ASC") }

  def to_s
	return description
  end

  def type_name
    if type == 'LensCoatingsInventory'
	  'Lens Coatings'
	else
      type.sub('Inventory', '')
	end
  end
  
  def enabled?
    return @current_account.plan.inventory
  end
end
