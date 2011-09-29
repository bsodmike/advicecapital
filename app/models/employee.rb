class Employee < ActiveRecord::Base
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # full regex

  validates :name, :presence => true
  validates :title, :presence => true
  validates :email, :presence => true, :format => { :with => email_regex }
  validates :phone, :presence => true
  validates :image, :presence => true

  def as_json(options={})
    { :id => self.id, :name => self.name, :title => self.title, :email => self.email, :phone => self.phone, :image => self.image }
  end

end
