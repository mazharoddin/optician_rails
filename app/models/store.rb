class Store < ActiveRecord::Base
  belongs_to :state
  belongs_to :country
  attr_accessible :address, :city, :email, :fax, :friday_close, :friday_open, :monday_close, :monday_open, :name, :phone, :postal_code, :saturday_close, :saturday_open, :sunday_close, :sunday_open, :thursday_close, :thursday_open, :tuesday_close, :tuesday_open, :url, :wednesday_close, :wednesday_open
  validates :name, :city, :presence => true
end
