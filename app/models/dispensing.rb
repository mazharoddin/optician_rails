class Dispensing < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :patient
  belongs_to :optometrist
  belongs_to :prescription
  belongs_to :od_brand
  belongs_to :os_brand
  attr_accessible :description, :expiry_date, :notes, :od_add, :od_axis, :od_base1, :od_base2, :od_base_curve, :od_cylinder, :od_diameter, :od_prism1, :od_prism2, :od_sphere, :os_add, :os_axis, :os_base1, :os_base2, :os_base_curve, :os_cylinder, :os_diameter, :os_prism1, :os_prism2, :os_sphere, :rx_date, :invoice_id
end
