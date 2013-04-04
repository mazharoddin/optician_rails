class PersonalTitle < ActiveRecord::Base
  attr_accessible :title, :active
  
  belongs_to :account
  
  has_many :patient

  validates :title, :presence => true, :uniqueness => true

  default_scope { order("title ASC") }

  scope :active, where('active = true')
  
  def to_s
	return title
  end
end
