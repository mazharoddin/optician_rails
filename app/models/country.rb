class Country < ActiveRecord::Base
	has_many :states
	has_many :stores
	
	validates :name, :presence => true
	
	def to_s
		return name
	end
end
