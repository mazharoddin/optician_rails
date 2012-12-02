class Optometrist < ActiveRecord::Base
  belongs_to :personal_title
  belongs_to :business_state, :class_name => 'State'
  belongs_to :business_country, :class_name => 'Country'
  has_many :glasses_prescription
  has_many :contacts_prescription
  attr_accessible :business_address, :business_city, :business_name, :business_postal_code, :email, :fax, :first_name, :last_name, :phone, :website, :personal_title_id, :business_state_id, :business_country_id
  
  def to_s
	return full_name
  end
  
	def full_name
	    if first_name == nil or first_name.empty? then
	        if last_name == nil or last_name.empty? then
		        full_name = ""
		    else
		        full_name = last_name
		  end
	    else
		    if last_name == nil or last_name.empty? then
			    full_name = first_name
			else
			    full_name = "#{first_name} #{last_name}"
			end
		end
	end
end
