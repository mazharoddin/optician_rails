class Tax < ActiveRecord::Base
  has_many :tax_class
  
  attr_accessible :name, :rate, :start_at, :end_at
  
  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :rate, :presence => true
  validates :start_at, :presence => true
  
  def to_s
	return name
  end
end
