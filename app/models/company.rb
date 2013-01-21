class Company < ActiveRecord::Base
  belongs_to :account

  attr_accessible  :active, :name

  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 60 }
  
  def to_s
	return name
  end
end
