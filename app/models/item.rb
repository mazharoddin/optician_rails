class Item < ActiveRecord::Base
  attr_accessible :description, :discount, :inventory_id, :invoice_id, :qty, :tax_a_amount, :tax_a_id, :tax_b_amount, :tax_b_id, :unit_price

  belongs_to :account
  belongs_to :inventory
  belongs_to :invoice
  belongs_to :tax_a, :class_name => 'Tax'
  belongs_to :tax_b, :class_name => 'Tax'
  
  validates :description, :presence => true, :length => { :maximum => 255 }
  validates :discount, :presence => true, :numericality => { :greater_than_or_qual_to => 0 }
  validates :invoice_id, :presence => true
  validates :qty, :presence => true, :numericality => { :greater_than_or_qual_to => 0 }
  validates :tax_a_amount, :presence => true, :numericality => { :greater_than_or_qual_to => 0 }, :if => :tax_b_id
  validates :tax_b_amount, :presence => true, :numericality => { :greater_than_or_qual_to => 0 }, :if => :tax_b_id
  validates :unit_price, :presence => true, :numericality => { :greater_than_or_qual_to => 0 }
  
  default_scope { order("id ASC") }

  after_save do |item|
    invoice = item.invoice
    invoice.total = invoice.sub_total
	invoice.taxes.each do |tax|
	invoice.total = invoice.total + tax[:amount]
	end
	invoice.save
  end

  before_save do |item|
	item.total_price = (item.unit_price - item.discount) * item.qty
	if item.tax_a != nil
	  item.tax_a_amount = item.total_price * item.tax_a.rate / 100
	end
	if item.tax_b != nil
	  item.tax_b_amount = item.total_price * item.tax_b.rate / 100
	end
  end
end
