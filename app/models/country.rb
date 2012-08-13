class Country < ActiveRecord::Base
	validates :name, :abbreviation, :presence => true
end
