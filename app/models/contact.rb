class Contact
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :name, :email, :message
  validates_presence_of :name, :email, :message

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

end
