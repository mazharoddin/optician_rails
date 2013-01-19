class LensType < ActiveRecord::Base
  after_create :lens_type_created
  after_update :lens_type_updated

  attr_accessible :name, :active

  belongs_to :account
  has_many :lens_type_history
  
  validates :name, :presence => true, :uniqueness => true
  
  def to_s
	return name
  end
  
  private
  def lens_type_created
    lens_type = LensTypeHistory.new(
	  :lens_type_id => id,
	  :name => name,
	  :active => active,
	  :start_at => DateTime.now,
	  :end_at => nil);
	lens_type.save
  end
  
  def lens_type_updated
    lens_type = LensTypeHistory.where('lens_type_id = ? and end_at is null', id).first
	if lens_type != nil then
		lens_type.end_at = DateTime.now
		lens_type.save
	end
	
	lens_type_created
  end
end
