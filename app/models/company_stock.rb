class CompanyStock < ActiveRecord::Base
  validates :primo,
            :presence => true
  validates :ultimo,
            :presence => true
end
