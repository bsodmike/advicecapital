class Message
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming


  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # full regex

  attr_accessor :id, :name, :email, :message
  validates :name, :presence => true, :length => { :minimum => 2 }
  validates :email, :presence => true, :format => { :with => email_regex }
  validates :message, :presence => true, :length => { :minimum => 2 }

  def initialize(attributes = {})
    attributes.each do |key, value|
      send("#{key}=", value)
    end
  end

  def persisted?
    false
  end

end
