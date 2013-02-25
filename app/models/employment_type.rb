class EmploymentType < ActiveRecord::Base
  attr_accessible :active, :name
  
  belongs_to :account
  
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 60 }
  
  default_scope { order("name ASC") }

  def to_s
	return name
  end
end
