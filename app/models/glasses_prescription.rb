class GlassesPrescription < Prescription
#  belongs_to :patient
#  belongs_to :optometrist
#  
#  attr_accessible :description, :expiry_date, :notes, :od_add, :od_axis, :od_base1, :od_base2, :od_cylinder, :od_prism1, :od_prism2, :od_sphere, :os_add, :os_axis, :os_base1, :os_base2, :os_cylinder, :os_prism1, :os_prism2, :os_sphere, :rx_date, :patient_id, :optometrist_id
#
#  validates :patient_id, :presence => true
#  validates :optometrist_id, :presence => true
#  validates :rx_date, :presence => true
#  
#  def to_s#
#	if description == nill or description == '' then
#		return rx_date
#	end
#	return description + '(' + rx_date + ')'
#  end
end
