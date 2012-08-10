class Employee < ActiveRecord::Base
	validates :password, :confirmation => true
end
