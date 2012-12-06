class Employee < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :registerable,
  # and :omniauthable
  devise :database_authenticatable, :timeoutable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :personal_title
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :personal_title_id, :first_name, :last_name, :active, :administrator, :dispensing_optician, :email, :password, :password_confirmation, :remember_me, :active

  validates :personal_title, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
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
	
	def to_s
		return full_name
	end
end
