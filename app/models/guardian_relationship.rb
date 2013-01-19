class GuardianRelationship < ActiveRecord::Base
  attr_accessible :name, :active

  belongs_to :account
  
  validates :name, :presence => true, :uniqueness => true
  
  def to_s
	return name
  end
end
