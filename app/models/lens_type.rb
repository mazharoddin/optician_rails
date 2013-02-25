class LensType < ActiveRecord::Base
  attr_accessible :active, :name

  belongs_to :account
  
  validates :name, :presence => true, :length => { :maximum => 60 }, :uniqueness => true
  
  default_scope { order("name ASC") }

  def to_s
	return name
  end
end
