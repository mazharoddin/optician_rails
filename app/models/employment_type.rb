class EmploymentType < ActiveRecord::Base
  attr_accessible :name
  
  validates :name, :presence => true, :uniqueness => true
  
  def to_s
	return name
  end
end
