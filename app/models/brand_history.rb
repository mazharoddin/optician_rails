class BrandHistory < ActiveRecord::Base
  attr_accessible :brand_id, :active, :end_at, :id, :name, :start_at

  belongs_to :brand  
end
