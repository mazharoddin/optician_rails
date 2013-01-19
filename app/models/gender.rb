class Gender < ActiveRecord::Base
  belongs_to :account
  
  attr_accessible :name, :active
  
  validates :name, :presence => true, :uniqueness => true

  def to_s
	return name
  end
end
