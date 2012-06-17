class Box < ActiveRecord::Base
  attr_accessible :name, :content
  
  translates :name, :content
  
  validates :content, :presence => true

end
