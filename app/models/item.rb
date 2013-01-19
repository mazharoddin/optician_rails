class Item < ActiveRecord::Base
  belongs_to :tax_a, :class_name => 'TaxHistory'
  belongs_to :tax_b, :class_name => 'TaxHistory'
  belongs_to :invoice
  belongs_to :inventory
  belongs_to :account
  
  attr_accessible :description, :discount, :qty, :tax_a_amount, :tax_b_amount, :total_price, :unit_price, :tax_a_id, :tax_b_id, :invoice_id, :inventory_id
end
