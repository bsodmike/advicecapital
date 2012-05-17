class News < ActiveRecord::Base
  
  translates :title, :content

  validates :title, :presence => true, :uniqueness => true, :length => { :maximum => 50 }
  validates :content, :presence => true
  validates :date, :presence => true

  def to_param
    "#{id}-#{title.parameterize}"
  end

end
