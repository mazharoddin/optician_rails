class Gender < ActiveRecord::Base
  attr_accessible :name
  
  def to_s
	return name
  end
end
