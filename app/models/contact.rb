class Contact
  include ActiveModel::Validations
  include ActiveModel::Conversion

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # full regex

  attr_accessor :id, :name, :email, :message
  validates :name, :presence => true, :length => { :minimum => 2 }
  validates :email, :presence => true, :format => { :with => email_regex }
  validates :message, :presence => true, :length => { :minimum => 2 }

  def initialize(attributes = {})
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
    @attributes = attributes
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end

  def to_key

  end

  def save
    if self.valid?
      Notifier.support_notification(self).deliver!
      return true
    end
    return false
  end

  def persisted?
    false
  end

end
