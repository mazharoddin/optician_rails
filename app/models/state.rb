class State < ActiveRecord::Base
  validates :name, :short_name, :presence => true
  
  belongs_to :country
  
  attr_accessible :name, :short_name, :active
  
  validates :name, :presence => true
  validates :name, :uniqueness => { :scope => :country_id }
  validates :short_name, :uniqueness => { :scope => :country_id }
  
  def to_s
    if short_name == nil or short_name == '' then
		return name
	end
	return short_name
  end
end
