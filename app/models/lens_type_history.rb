class LensTypeHistory < ActiveRecord::Base
  attr_accessible :active, :end_at, :lens_type_id, :name, :start_at

  belongs_to :account
  belongs_to :lens_type
end
