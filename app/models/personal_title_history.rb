class PersonalTitleHistory < ActiveRecord::Base
  belongs_to :personal_title
  
  attr_accessible :active, :end_at, :personal_title_id, :start_at, :title
end
