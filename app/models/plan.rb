class Plan < ActiveRecord::Base
  attr_accessible :inventory, :multistore, :name, :price
  
  has_many :accounts
  
  validates :name, :presence => true, :length => { :maximum => 60 }
  validates :price, :presence => true, :numericality => { :greater_than_or_qual_to => 0 }

  default_scope { order("name ASC") }

  def to_s
    name
  end
end
