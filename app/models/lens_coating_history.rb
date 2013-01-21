class LensCoatingHistory < ActiveRecord::Base
  attr_accessible :active, :end_at, :lens_coating_id, :name, :start_at

  belongs_to :leans_coating
  belongs_to :account
end
