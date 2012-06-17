class News < ActiveRecord::Base
  
  attr_accessible :title, :content, :date
  
  translates :title, :content

  validates :title, :presence => true, :uniqueness => true, :length => { :maximum => 50 }
  validates :content, :presence => true
  validates :date, :presence => true

  def to_param
    "#{id}-#{title.parameterize}"
  end

end
