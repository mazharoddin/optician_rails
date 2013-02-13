require 'date'

class Invoice < ActiveRecord::Base
  attr_accessible :address, :balance, :city, :country, :invoice_date, :locked_date, :name, :paid, :postal_code, :state, :total, :void_date

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
    if invoice.new_record? then
		invoice.name = 'Cash Sale'
		invoice.address = ''
		invoice.city = ''
		invoice.state = ''
		invoice.postal_code = ''
		invoice.country = ''
		invoice.total = 0.00
		invoice.paid = 0.00
		invoice.balance = 0.00
	end
    if invoice.patient != nil then
		invoice.name = invoice.patient.to_s
		invoice.address = invoice.patient.home_address
		invoice.city = invoice.patient.home_city
		invoice.state = invoice.patient.home_state
		invoice.postal_code = invoice.patient.home_postal_code
		invoice.country = invoice.patient.home_country
	end
  end
  
  def read_only?
    void_date != nil || locked_date != nil
  end

  def sub_total
    sub_total = 0.00
	items.each do |item|
	    sub_total = sub_total + (item.unit_price - item.discount) * item.qty
	end
	sub_total
  end
  
  def taxes
    taxes = []
    items.each do |item|
	    if item.tax_a != nil
			appended = false
		    taxes.each do |tax|
				if tax[:tax].id == item.tax_a.id
					tax[:amount] = tax[:amount] + item.tax_a_amount
					appended = true
				end
			end
			if appended == false
				taxes.append( :tax => item.tax_a, :amount => item.tax_a_amount )
			end
		end
	    if item.tax_b != nil
			appended = false
		    taxes.each do |tax|
				if tax[:tax].id == item.tax_b.id
					tax[:amount] = tax[:amount] + item.tax_b_amount
					appended = true
				end
			end
			if appended == false
				taxes.append( :tax => item.tax_b, :amount => item.tax_b_amount )
			end
		end
	end
	taxes
  end
end
