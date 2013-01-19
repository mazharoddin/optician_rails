class Prescription < ActiveRecord::Base
  belongs_to :patient
  belongs_to :optometrist
  belongs_to :os_brand, :class_name => "Brand"
  belongs_to :od_brand, :class_name => "Brand"
  belongs_to :account
  
  attr_accessible :description, :expiry_date, :notes, :od_add, :od_axis, :od_base1, :od_base2, :od_base_curve, :od_brand_id, :od_cylinder, :od_prism1, :od_prism2, :od_sphere, :os_add, :os_axis, :os_base1, :os_base2, :os_base_curve, :os_brand_id, :os_cylinder, :os_prism1, :os_prism2, :os_sphere, :rx_date, :patient_id, :optometrist_id, :od_diameter, :os_diameter

  validates :patient_id, :presence => true
  validates :optometrist_id, :presence => true
  validates :rx_date, :presence => true
  
  def to_s
	if description == nill or description == '' then
		return rx_date
	end
	return description + '(' + rx_date + ')'
  end
end
