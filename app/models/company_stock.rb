class CompanyStock < ActiveRecord::Base
  attr_accessible :primo, :ultimo, 
  
  validates :primo,
            :presence => true
  validates :ultimo,
            :presence => true
end
