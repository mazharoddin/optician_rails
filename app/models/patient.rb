class Patient < ActiveRecord::Base
  attr_accessible :alergies, :birthday, :email, :employment_type_id, :first_name, :gender_id, :guardian_alt_phone, :guardian_name, :guardian_phone, :guardian_relationship_id, :home_address, :home_city, :home_country_id, :home_phone, :home_postal_code, :home_state_id, :last_name, :medical_other, :mobile_phone, :note, :occupation, :optometrist_id, :personal_title_id, :postal_address, :postal_city, :postal_country_id, :postal_postal_code, :postal_state_id, :preferred_name, :smoker, :work_ext, :work_phone
  
  belongs_to :account
  belongs_to :employment_type
  belongs_to :gender
  belongs_to :guardian_relationship
  belongs_to :home_country, :class_name => 'Country'
  belongs_to :home_state, :class_name => 'State'
  belongs_to :optometrist
  belongs_to :personal_title
  belongs_to :postal_country, :class_name => 'Country'
  belongs_to :postal_state, :class_name => 'State'
  
  has_many :contacts_prescriptions
  has_many :dispensing
  has_many :glasses_prescriptions
  has_many :invoices
  
  validates :alergies, :length => { :maximum => 65535 }
  validates :email, :length => { :maximum => 255 }
  validates :first_name, :length => { :maximum => 40 }
  validates :guardian_alt_phone, :length => { :maximum => 20 }
  validates :guardian_name, :length => { :maximum => 80 }
  validates :guardian_phone, :length => { :maximum => 20 }
  validates :home_address, :length => { :maximum => 255 }
  validates :home_city, :length => { :maximum => 80 }
  validates :home_phone, :length => { :maximum => 20 }
  validates :home_postal_code, :length => { :maximum => 20 }
  validates :last_name, :presence => true, :length => { :maximum => 40 }
  validates :medical_other, :length => { :maximum => 65535 }
  validates :mobile_phone, :length => { :maximum => 20 }
  validates :note, :length => { :maximum => 65535 }
  validates :occupation, :length => { :maximum => 80 }
  validates :postal_address, :length => { :maximum => 255 }
  validates :postal_city, :length => { :maximum => 80 }
  validates :postal_postal_code, :length => { :maximum => 20 }
  validates :preferred_name, :length => { :maximum => 40 }
  validates :work_ext, :length => { :maximum => 5 }
  validates :work_phone, :length => { :maximum => 20 }

  default_scope { order("last_name ASC, first_name ASC, home_city ASC") }

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
