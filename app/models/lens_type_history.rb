class LensTypeHistory < ActiveRecord::Base
  belongs_to :account
  belongs_to :lens_type
  attr_accessible :active, :end_at, :lens_type_id, :name, :start_at
end
