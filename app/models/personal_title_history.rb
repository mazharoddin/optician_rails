class PersonalTitleHistory < ActiveRecord::Base
  attr_accessible :active, :end_at, :personal_title_id, :start_at, :title

  belongs_to :personal_title
  belongs_to :account
end
