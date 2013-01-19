class Brand < ActiveRecord::Base
  after_create :brand_created
  after_update :brand_updated

  attr_accessible :name, :active
  
  has_many :brand_history
  belongs_to :account
  
  validates :name, :presence => true, :uniqueness => true
  
  def to_s
	return name
  end
  
  private
  def brand_created
    brand_history = BrandHistory.new(
	  :brand_id => id,
	  :name => name,
	  :active => active,
	  :start_at => DateTime.now,
	  :end_at => nil);
	brand_history.save
  end
  
  def brand_updated
    brand_history = BrandHistory.where('brand_id = ? and end_at is null', id).first
	if brand_history != nil then
		brand_history.end_at = DateTime.now
		brand_history.save
	end
	
	brand_created
  end
end
