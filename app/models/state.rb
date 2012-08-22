class State < ActiveRecord::Base
  validates :name, :short_name, :presence => true
  
  belongs_to :country
end
