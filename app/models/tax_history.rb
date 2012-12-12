class TaxHistory < ActiveRecord::Base
  belongs_to :tax
  attr_accessible :end_at, :name, :rate, :start_at, :tax_id
end
