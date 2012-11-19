class State < ActiveRecord::Base
  validates :name, :short_name, :presence => true
  
  belongs_to :country
  
  def to_s
	return short_name
  end
end
