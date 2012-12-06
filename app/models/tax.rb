class Tax < ActiveRecord::Base
  has_many :tax_class
  
  attr_accessible :amount, :name, :rate
  
  validates :name, :presence => true
  validates :name, :uniqueness => true
  
  def to_s
	return name
  end
end
