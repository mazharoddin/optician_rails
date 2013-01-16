require 'date'

class Tax < ActiveRecord::Base
  after_create :tax_created
  after_update :tax_updated
  
  attr_accessible :name, :rate
  
  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :rate, :presence => true
  
  def to_s
	return name
  end
  
  private
  def tax_created
    tax_history = TaxHistory.new(
	  :tax_id => id,
	  :name => name,
	  :rate => rate,
	  :start_at => DateTime.now,
	  :end_at => nil);
	tax_history.save
  end
  
  def tax_updated
    tax_history = TaxHistory.where('end_at is null').first
	tax_history.end_at = DateTime.now
	tax_history.save
	
	tax_created
  end
end
