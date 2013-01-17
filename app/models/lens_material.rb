class LensMaterial < ActiveRecord::Base
  after_create :lens_material_created
  after_update :lens_material_updated

  attr_accessible :name, :active

  has_many :lens_material_history

  validates :name, :presence => true, :uniqueness => true
  
  def to_s
	return name
  end
  
  private
  def lens_material_created
    lens_material = LensMaterialHistory.new(
	  :lens_material_id => id,
	  :name => name,
	  :active => active,
	  :start_at => DateTime.now,
	  :end_at => nil);
	lens_material.save
  end
  
  def lens_material_updated
    lens_material = LensMaterialHistory.where('lens_material_id = ? and end_at is null', id).first
	if lens_material != nil then
		lens_material.end_at = DateTime.now
		lens_material.save
	end
	
	lens_material_created
  end
end
