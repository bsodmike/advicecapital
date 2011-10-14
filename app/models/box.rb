class Box < ActiveRecord::Base
  validates :content, :presence => true

end
