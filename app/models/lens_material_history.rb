class LensMaterialHistory < ActiveRecord::Base
  attr_accessible :active, :end_at, :lens_material_id, :name, :start_at

  belongs_to :leans_material
  belongs_to :account
end
