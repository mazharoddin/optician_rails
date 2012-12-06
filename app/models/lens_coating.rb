class LensCoating < ActiveRecord::Base
  has_and_belongs_to_many :inventory
  
  attr_accessible :name, :active
  
  validates :name, :presence => true, :uniqueness => true
  
  def to_s
	return name
  end
end
