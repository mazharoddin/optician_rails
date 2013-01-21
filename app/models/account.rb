class Account < ActiveRecord::Base
  attr_accessible :active, :name, :subdomain

  has_many :accessories_inventory
  has_many :brands
  has_many :brand_histories
  has_many :companies
  has_many :countries
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
  has_many :personal_titles
  has_many :personal_title_histories
  has_many :prescriptions
  has_many :services_inventory
  has_many :states
  has_many :stores
  has_many :taxes
  has_many :tax_histories
  has_many :users
  
  validates :name, :length => { :maximum => 60 }, :presence => true, :uniqueness => true
  validates :subdomain, :length => { :maximum => 80 }, :presence => true, :uniqueness => true
end
