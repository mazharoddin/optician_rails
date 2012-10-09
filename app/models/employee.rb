class Employee < ActiveRecord::Base
	validates :title, :first_name, :last_name, :email, :presence => true
	
	validates :password, :confirmation => true
	
	def full_name
	    if first_name == nil or first_name.empty? then
	        if last_name == nil or last_name.empty? then
		        full_name = ""
		    else
		        full_name = last_name
		  end
	    else
		    if last_name == nil or last_name.empty? then
			    full_name = first_name
			else
			    full_name = "#{first_name} #{last_name}"
			end
		end
	end
end
