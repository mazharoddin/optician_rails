class Tax < ActiveRecord::Base
  attr_accessible :amount, :name, :rate
end
