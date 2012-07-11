#encoding UTF-8

class AdvicePage < ActiveRecord::Base
  attr_accessible :title, :content, :template, :slug
  
  translates :title, :content

  class AdvicePage::Translation
  	attr_accessible :locale
  end

end
