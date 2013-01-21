require 'date'

class Invoice < ActiveRecord::Base
  attr_accessible :address, :balance, :city, :country, :invoice_date, :name, :paid, :postal_code, :state, :total, :void_date

  belongs_to :account
  belongs_to :patient
    
  has_many :dispensing
  has_many :contacts_dispensing
  has_many :glasses_dispensing
  has_many :items

  validates :address, :length => { :maximum => 255 }
  validates :balance, :numericality => { :greater_than_or_equal_to => 0 }, :presence => true
  validates :city, :length => { :maximum => 80 }
  validates :country, :length => { :maximum => 60 }
  validates :name, :length => { :maximum => 255 }
  validates :paid, :numericality => { :greater_than_or_equal_to => 0 }, :presence => true
  validates :postal_code, :length => { :maximum => 20 }
  validates :state, :length => { :maximum => 10 }
  validates :total, :numericality => { :greater_than_or_equal_to => 0 }, :presence => true

  after_initialize do |invoice|
    if invoice.patient != nil then
		invoice.name = invoice.patient.full_name
		invoice.address = invoice.patient.home_address
		invoice.city = invoice.patient.home_city
		invoice.state = invoice.patient.home_state
		invoice.postal_code = invoice.patient.home_postal_code
		invoice.country = invoice.patient.home_country
	else
		invoice.name = 'Cash Sale'
		invoice.address = ''
		invoice.city = ''
		invoice.state = ''
		invoice.postal_code = ''
		invoice.country = ''
		#invoice.invoice_date = DateTime.now
		invoice.total = 0.00
		invoice.paid = 0.00
		invoice.balance = 0.00
	end
  end
end
