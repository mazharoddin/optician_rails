class Company < ActiveRecord::Base
  attr_accessible :name, :type, :active

  belongs_to :account
  validates :name, :presence => true, :uniqueness => true
  
  def to_s
	return name
  end
end
