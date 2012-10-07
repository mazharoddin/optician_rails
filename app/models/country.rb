class Country < ActiveRecord::Base
	has_many :states
	has_many :stores
	
	validates :name, :presence => true
end
