class Registration
  include ActiveModel::MassAssignmentSecurity
  include ActiveModel::Validations
  
  attr_accessible :address, :business_name, :city, :country_id, :email, :first_name, :last_name, :password, :password_confirmation, :postal_code, :state_id, :subdomain, :url

  attr_accessor :address, :business_name, :city, :country_id, :email, :first_name, :last_name, :password, :password_confirmation, :postal_code, :state_id, :subdomain, :url

  validates :address, :length => { :maximum => 255 }
  validates :business_name, :length => { :maximum => 60 }, :presence => true
  validates :city, :presence => true, :length => { :within => 1..60 }
  validates :country_id, :presence => true
  validates :email, :presence => true, :length => { :maximum => 40 }
  validates :first_name, :length => { :maximum => 40 }
  validates :last_name, :presence => true, :length => { :maximum => 40 }
  validates :password, :confirmation => true, :length => { :minimum => 6 }, :presence => true, :on => :create
  validates :postal_code, :length => { :maximum => 20 }
  validates :state_id, :presence => true
  validates :subdomain, :length => { :maximum => 80 }, :presence => true
  validates :url, :length => { :maximum => 255 }
  
  default_scope { order("business_name ASC") }

  def initialize(attributes = {})
    @address  = attributes[:address]
    @business_name = attributes[:business_name]
    @city = attributes[:city]
    @country_id = attributes[:country_id]
	@email = attributes[:email]
	@first_name = attributes[:first_name]
	@last_name = attributes[:last_name]
	@password = attributes[:password]
	@password_confirmation = attributes[:password_confirmation]
	@postal_code = attributes[:postal_code]
	@state_id = attributes[:state_id]
	@subdomain = attributes[:subdomain]
	@url = attributes[:url]
  end
  
  def persisted?
	false
  end

end
