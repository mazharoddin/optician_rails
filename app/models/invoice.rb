require 'date'

class Invoice < ActiveRecord::Base
  belongs_to :patient
  
  has_many :items
  
  attr_accessible :address, :balance, :city, :country, :invoice_date, :name, :paid, :postal_code, :state, :total, :void_date
  
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
