class Store < ActiveRecord::Base
  belongs_to :state
  belongs_to :country
  belongs_to :account
  
  attr_accessible :address, :city, :email, :fax, :friday_close, :friday_open, :monday_close, :monday_open, :name, :phone, :postal_code, :saturday_close, :saturday_open, :sunday_close, :sunday_open, :thursday_close, :thursday_open, :tuesday_close, :tuesday_open, :url, :wednesday_close, :wednesday_open, :state_id, :country_id, :active
  
  validates :name, :presence => true, :uniqueness => true
  validates :city, :presence => true
  validates :state_id, :presence => true
  validates :country_id, :presence => true
  
  def to_s
	return name
  end
end
