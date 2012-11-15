class PersonalTitle < ActiveRecord::Base
  has_many :personal_titles
  attr_accessible :title
  
  def to_s
	return title
  end
end
