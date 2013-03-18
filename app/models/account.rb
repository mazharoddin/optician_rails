class Account < ActiveRecord::Base
  attr_accessible :active, :address, :city, :country_id, :employees_attributes, :fax, :name, :phone, :plan_id, :postal_code, :state_id, :subdomain, :url, :employees

  belongs_to :country
  belongs_to :plan
  belongs_to :state
  
  has_many :accessories_inventory
  has_many :appointments
  has_many :brands
  has_many :brand_histories
  has_many :companies
  has_many :dispensing
  has_many :employees
  has_many :employment_types
  has_many :genders
  has_many :guardian_relationships
  has_many :inventory
  has_many :inventory_lens_coatings
  has_many :invoices
  has_many :items
  has_many :lens_coatings
  has_many :lens_coating_histories
  has_many :lens_materials
  has_many :lens_material_histories
  has_many :lens_types
  has_many :lens_type_histories
  has_many :optometrists
  has_many :patients
  has_many :payment_methods
  has_many :personal_titles
  has_many :personal_title_histories
  has_many :prescriptions
  has_many :services_inventory
  has_many :stores
  has_many :taxes
  has_many :tax_histories
  has_many :users
  
  validates :address, :length => { :maximum => 255 }
  validates :city, :presence => true, :length => { :maximum => 60 }
  validates :country_id, :presence => true
  validates :fax, :length => { :maximum => 30 }
  validates :name, :length => { :maximum => 60 }, :presence => true, :uniqueness => true
  validates :phone, :length => { :maximum => 30 }
  validates :plan_id, :presence => true
  validates :postal_code, :length => { :maximum => 20 }
  validates :state_id, :presence => true
  validates :subdomain, :length => { :maximum => 80 }, :exclusion => { :in => %w( admin administration users registration blog ) }, :presence => true, :uniqueness => true
  validates :url, :length => { :maximum => 255 }

  accepts_nested_attributes_for :employees

  default_scope { order("name ASC") }
end
