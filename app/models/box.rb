class Box < ActiveRecord::Base
  attr_accessible :title, :name, :content, :locale, :translations_attributes
  
  translates :name, :content
  
  validates :content, :presence => true

  class Translation
    attr_accessible :locale
  end

end
