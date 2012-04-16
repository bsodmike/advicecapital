class Box < ActiveRecord::Base
  translates :name, :content
  
  validates :content, :presence => true

end
