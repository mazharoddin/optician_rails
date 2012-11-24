class ContactsPrescription < ActiveRecord::Base
  belongs_to :patient
  belongs_to :optometrist
  belongs_to :os_brand, :class_name => "Brand"
  belongs_to :od_brand, :class_name => "Brand"
  
  attr_accessible :description, :expiry_date, :notes, :od_add, :od_axis, :od_cylinder, :od_sphere, :od_diameter, :od_base_curve, :od_brand_id, :os_add, :os_axis, :os_cylinder, :os_sphere, :os_diameter, :os_base_curve, :os_brand_id, :rx_date, :optometrist_id
end
