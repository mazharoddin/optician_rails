class State < ActiveRecord::Base
  attr_accessible :name, :short_name, :active

  belongs_to :account
  belongs_to :country

  validates :name, :presence => true, :uniqueness => { :scope => :country_id }
  validates :short_name, :presence => true, :uniqueness => { :scope => :country_id }
  
  default_scope { order("name ASC") }

  def to_s
    if short_name == nil or short_name == '' then
		return name
	end
	return short_name
  end
end
