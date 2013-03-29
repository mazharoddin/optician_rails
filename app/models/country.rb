class Country < ActiveRecord::Base
    attr_accessible :active, :name

	belongs_to :account

	has_many :states
	has_many :locations

    validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 60 }
	
    default_scope { order("name ASC") }

	def to_s
		return name
	end
end
