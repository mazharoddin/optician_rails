class Item < ActiveRecord::Base
  attr_accessible :description, :discount, :inventory_id, :invoice_id, :qty, :tax_a_amount, :tax_a_id, :tax_b_amount, :tax_b_id, :total_price, :unit_price

  belongs_to :account
  belongs_to :inventory
  belongs_to :invoice
  belongs_to :tax_a, :class_name => 'TaxHistory'
  belongs_to :tax_b, :class_name => 'TaxHistory'
  
  validates :description, :presence => true, :length => { :maximum => 255 }
  validates :discount, :presence => true, :numericality => { :greater_than_or_qual_to => 0 }
  validates :invoice_id, :presence => true
  validates :qty, :presence => true, :numericality => { :greater_than_or_qual_to => 0 }
  validates :tax_a_amount, :presence => true, :numericality => { :greater_than_or_qual_to => 0 }, :if => :tax_b_id
  validates :tax_b_amount, :presence => true, :numericality => { :greater_than_or_qual_to => 0 }, :if => :tax_b_id
  validates :total_price, :presence => true, :numericality => { :greater_than_or_qual_to => 0 }
  validates :unit_price, :presence => true, :numericality => { :greater_than_or_qual_to => 0 }
end
