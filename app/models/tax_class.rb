class TaxClass < ActiveRecord::Base
  belongs_to :tax_a, :class_name => 'Tax'
  belongs_to :tax_b, :class_name => 'Tax'
  attr_accessible :name, :tax_a_id, :tax_b_id, :tax_b_applies_tax_a
end
