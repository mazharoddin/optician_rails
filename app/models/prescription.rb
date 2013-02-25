class Prescription < ActiveRecord::Base
  attr_accessible :description, :expiry_date, :notes, :od_add, :od_axis, :od_base1, :od_base2, :od_base_curve, :od_brand_id, :od_cylinder, :od_diameter, :od_prism1, :od_prism2, :od_sphere, :optometrist_id, :os_add, :os_axis, :os_base1, :os_base2, :os_base_curve, :os_brand_id, :os_cylinder, :os_diameter, :os_prism1, :os_prism2, :os_sphere, :patient_id, :rx_date

  belongs_to :account
  belongs_to :od_brand, :class_name => "Brand"
  belongs_to :optometrist
  belongs_to :os_brand, :class_name => "Brand"
  belongs_to :patient
  
#  validate :increment_in_quarters
  
  validates :description, :length => { :maximum => 80 }
#  validates :expiry_date
  validates :notes, :length => { :maximum => 65535 }
  validates :od_add, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5 }, :allow_blank => true, :allow_nil => true
  validates :od_axis, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 180, :integer_only => true }, :allow_blank => true, :allow_nil => true
  validates :od_base1, :inclusion => { :in => %w( down up ) }, :allow_blank => true, :allow_nil => true
  validates :od_base2, :inclusion => { :in => %w( down up ) }, :allow_blank => true, :allow_nil => true
#  validates :od_base_curve
  validates :od_cylinder, :numericality => { :greater_than_or_equal_to => -30, :less_than_or_equal_to => 30 }, :allow_blank => true, :allow_nil => true
#  validates :od_diameter
#  validates :od_prism1
#  validates :od_prism2
  validates :od_sphere, :numericality => { :greater_than_or_equal_to => -30, :less_than_or_equal_to => 30 }, :allow_blank => true, :allow_nil => true
  validates :optometrist_id, :presence => true
  validates :os_add, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5 }, :allow_blank => true, :allow_nil => true
  validates :os_axis, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 180, :integer_only => true }, :allow_blank => true, :allow_nil => true
  validates :os_base1, :inclusion => { :in => %w( down up ) }, :allow_blank => true, :allow_nil => true
  validates :os_base2, :inclusion => { :in => %w( down up ) }, :allow_blank => true, :allow_nil => true
#  validates :os_base_curve
  validates :os_cylinder, :numericality => { :greater_than_or_equal_to => -30, :less_than_or_equal_to => 30 }, :allow_blank => true, :allow_nil => true
#  validates :os_diameter
#  validates :os_prism1
#  validates :os_prism2
  validates :os_sphere, :numericality => { :greater_than_or_equal_to => -30, :less_than_or_equal_to => 30 }, :allow_blank => true, :allow_nil => true
  validates :patient_id, :presence => true
  validates :rx_date, :presence => true
  
  default_scope { order("rx_date DESC") }

  def to_s
	if description == nill or description == '' then
		return rx_date
	end
	return description + '(' + rx_date + ')'
  end
  
  def increment_in_quarters
    if od_add != nil and od_add.modulo(0.25) != 0 then
	  errors.add(:od_add, 'In increments of 0.25')
	end
    if od_cylinder != nil and od_cylinder.modulo(0.25) != 0 then
	  errors.add(:od_cylinder, 'In increments of 0.25')
	end
    if od_sphere != nil and od_sphere.modulo(0.25) != 0 then
	  errors.add(:od_sphere, 'In increments of 0.25')
	end
    if os_add != nil and os_add.modulo(0.25) != 0 then
	  errors.add(:os_add, 'In increments of 0.25')
	end
    if os_cylinder != nil and os_cylinder.modulo(0.25) != 0 then
	  errors.add(:os_cylinder, 'In increments of 0.25')
	end
    if os_sphere != nil and os_sphere.modulo(0.25) != 0 then
	  errors.add(:os_sphere, 'In increments of 0.25')
	end
  end
end
