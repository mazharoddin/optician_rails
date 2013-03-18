class PaymentMethod < ActiveRecord::Base
  attr_accessible :active, :name

  belongs_to :account

  validates :name, :length => { :maximum => 20 }

  default_scope { order("name ASC") }
  
  def to_s
    name
  end
end
