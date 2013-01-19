class LensCoatingHistory < ActiveRecord::Base
  belongs_to :leans_coating
  belongs_to :account
  attr_accessible :active, :end_at, :lens_coating_id, :name, :start_at
end
