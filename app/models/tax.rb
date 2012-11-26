class Tax < ActiveRecord::Base
  has_many :tax_class
  attr_accessible :amount, :name, :rate
  
  def to_s
	return name
  end
end
