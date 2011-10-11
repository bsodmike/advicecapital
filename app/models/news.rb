class News < ActiveRecord::Base
  validates :title, :presence => true, :uniqueness => true, :length => { :maximum => 50 }
  validates :content, :presence => true

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
