class Country < ActiveRecord::Base
	has_many :states
	has_many :stores
	
    attr_accessible :name, :active

    validates :name, :presence => true, :uniqueness => true
	
	def to_s
		return name
	end
end
