class Patient < ActiveRecord::Base
  belongs_to :personal_title
  belongs_to :gender
  belongs_to :home_state, :class_name => 'State'
  belongs_to :home_country, :class_name => 'Country'
  belongs_to :postal_state, :class_name => 'State'
  belongs_to :postal_country, :class_name => 'Country'
  belongs_to :optometrist
  belongs_to :employment_type
  belongs_to :guardian_relationship
  has_many :glasses_prescriptions
  has_many :glasses_prescriptions
  has_many :contacts_prescriptions
  attr_accessible :alergies, :birthday, :email, :first_name, :guardian_alt_phone, :guardian_name, :guardian_phone, :home_address, :home_city, :home_phone, :home_postal_code, :last_name, :medical_other, :mobile_phone, :note, :occupation, :postal_address, :postal_city, :postal_postal_code, :preferred_name, :smoker, :work_ext, :work_phone, :personal_title_id, :gender_id, :home_state_id, :home_country_id, :postal_state_id, :postal_country_id, :optometrist_id, :employment_type_id, :guardian_relationship_id

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
