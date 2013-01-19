class PersonalTitleHistory < ActiveRecord::Base
  belongs_to :personal_title
  belongs_to :account
  
  attr_accessible :active, :end_at, :personal_title_id, :start_at, :title
end
