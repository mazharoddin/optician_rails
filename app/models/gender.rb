class Gender < ActiveRecord::Base
  attr_accessible :active, :name
  
  belongs_to :account
  
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 10 }

  def to_s
	return name
  end
end
