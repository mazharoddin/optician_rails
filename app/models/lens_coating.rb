class LensCoating < ActiveRecord::Base
  attr_accessible :active, :name

  belongs_to :account
  
  has_and_belongs_to_many :inventory

  validates :name, :presence => true, :length => { :maximum => 60 }, :uniqueness => true
  
  default_scope { order("name ASC") }

  def to_s
	return name
  end
end
