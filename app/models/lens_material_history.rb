class LensMaterialHistory < ActiveRecord::Base
  belongs_to :leans_material
  belongs_to :account
  attr_accessible :active, :end_at, :lens_material_id, :name, :start_at
end
