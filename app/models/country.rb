class Country < ActiveRecord::Base
    attr_accessible :active, :name

	belongs_to :account

	has_many :states
	has_many :stores

    validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 60 }
	
	def to_s
		return name
	end
end
