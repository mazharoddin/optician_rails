class LensType < ActiveRecord::Base
  attr_accessible :name, :active
  
  validates :name, :presence => true, :uniqueness => true
  
  def to_s
	return name
  end
end
