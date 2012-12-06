class Company < ActiveRecord::Base
  attr_accessible :name, :type

  validates :name, :presence => true, :uniqueness => true
  
  def to_s
	return name
  end
end
