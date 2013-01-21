class TaxHistory < ActiveRecord::Base
  attr_accessible :end_at, :name, :rate, :start_at, :tax_id

  belongs_to :tax
  belongs_to :account
  
  def to_s
	return name
  end
end
