class PersonalTitle < ActiveRecord::Base
  has_many :personal_titles
  
  attr_accessible :title, :active
  
  validates :title, :presence => true, :uniqueness => true

  def to_s
	return title
  end
end
