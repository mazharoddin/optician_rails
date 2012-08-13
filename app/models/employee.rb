class Employee < ActiveRecord::Base
	validates :title, :first_name, :last_name, :email, :presence => true
	validates :password, :confirmation => true
end
