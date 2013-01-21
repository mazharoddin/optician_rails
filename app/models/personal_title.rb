class PersonalTitle < ActiveRecord::Base
  after_create :personal_title_created
  after_update :personal_title_updated

  attr_accessible :title, :active
  
  belongs_to :account
  
  has_many :patient
  has_many :personal_title_history

  validates :title, :presence => true, :uniqueness => true

  def to_s
	return title
  end
  
  private
  def personal_title_created
    personal_title = PersonalTitleHistory.new(
	  :personal_title_id => id,
	  :title => title,
	  :active => active,
	  :start_at => DateTime.now,
	  :end_at => nil);
	personal_title.account_id = account_id
	personal_title.save
  end
  
  def personal_title_updated
    personal_title = PersonalTitleHistory.where('personal_title_id = ? and end_at is null', id).first
	if personal_title != nil then
		personal_title.end_at = DateTime.now
		personal_title.save
	end
	
	personal_title_created
  end
end
