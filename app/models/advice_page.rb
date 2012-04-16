#encoding UTF-8

class AdvicePage < ActiveRecord::Base
  translates :title, :content
end
