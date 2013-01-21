class LensCoating < ActiveRecord::Base
  after_create :lens_coating_created
  after_update :lens_coating_updated

  attr_accessible :active, :name

  belongs_to :account
  
  has_and_belongs_to_many :inventory
  
  has_many :lens_coating_history

  validates :name, :presence => true, :length => { :maximum => 60 }, :uniqueness => true
  
  def to_s
	return name
  end
  
  private
  def lens_coating_created
    lens_coating = LensCoatingHistory.new(
	  :lens_coating_id => id,
	  :name => name,
	  :active => active,
	  :start_at => DateTime.now,
	  :end_at => nil);
	lens_coating.account_id = account_id
	lens_coating.save
  end
  
  def lens_coating_updated
    lens_coating = LensCoatingHistory.where('lens_coating_id = ? and end_at is null', id).first
	if lens_coating != nil then
		lens_coating.end_at = DateTime.now
		lens_coating.save
	end
	
	lens_coating_created
  end
end
