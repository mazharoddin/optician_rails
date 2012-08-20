class Country < ActiveRecord::Base
	has_many :states
	
	validates :name, :abbreviation, :presence => true
end
