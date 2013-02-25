class Optometrist < ActiveRecord::Base
  attr_accessible :active, :business_address, :business_city, :business_country_id, :business_name, :business_postal_code, :business_state_id, :email, :fax, :first_name, :last_name, :personal_title_id, :phone, :website

  belongs_to :account
  belongs_to :business_country, :class_name => 'Country'
  belongs_to :business_state, :class_name => 'State'
  belongs_to :personal_title

  has_many :contacts_prescription
  has_many :glasses_prescription

  validates :business_address, :length => { :maximum => 255 }
  validates :business_city, :length => { :maximum => 80 }
  validates :business_name, :length => { :maximum => 80 }
  validates :business_postal_code, :length => { :maximum => 20 }
  validates :email, :length => { :maximum => 255 }
  validates :fax, :length => { :maximum => 40 }
  validates :first_name, :length => { :maximum => 40 }
  validates :last_name, :presence => true, :length => { :maximum => 40 }
  validates :phone, :length => { :maximum => 40 }
  validates :website, :length => { :maximum => 255 }

  default_scope { order("last_name ASC, first_name ASC") }

	def to_s
	    if first_name == nil or first_name.empty? then
	        if last_name == nil or last_name.empty? then
		        ""
		    else
		        last_name
		  end
	    else
		    if last_name == nil or last_name.empty? then
			    first_name
			else
			    "#{first_name} #{last_name}"
			end
		end
	end
end
