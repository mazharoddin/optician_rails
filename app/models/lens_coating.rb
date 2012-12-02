class LensCoating < ActiveRecord::Base
  has_and_belongs_to_many :inventory
  attr_accessible :name
end
