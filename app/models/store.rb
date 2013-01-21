class Store < ActiveRecord::Base
  attr_accessible :active, :address, :city, :country_id, :email, :fax, :friday_close, :friday_open, :monday_close, :monday_open, :name, :phone, :postal_code, :saturday_close, :saturday_open, :state_id, :sunday_close, :sunday_open, :thursday_close, :thursday_open, :tuesday_close, :tuesday_open, :url, :wednesday_close, :wednesday_open
  
  belongs_to :account
  belongs_to :country
  belongs_to :state
  
  
  validates :address, :length => { :maximum => 255 }
  validates :city, :presence => true, :length => { :within => 1..60 }
  validates :country_id, :presence => true
  validates :email, :length => { :maximum => 255 }
  validates :fax, :length => { :maximum => 30 }
  validates :name, :presence => true, :length => { :within => 1..60 }, :uniqueness => true
  validates :phone, :length => { :maximum => 30 }
  validates :postal_code, :length => { :maximum => 20 }
  validates :state_id, :presence => true
  validates :url, :length => { :maximum => 255 }
  validates :monday_close, :presence => true, :if => :monday_open?
  validates :tuesday_close, :presence => true, :if => :tuesday_open?
  validates :wednesday_close, :presence => true, :if => :wednesday_open?
  validates :thursday_close, :presence => true, :if => :thursday_open?
  validates :friday_close, :presence => true, :if => :friday_open?
  validates :saturday_close, :presence => true, :if => :saturday_open?
  validates :sunday_close, :presence => true, :if => :sunday_open?
  
  def to_s
	return name
  end
end
