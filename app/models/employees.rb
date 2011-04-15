class Employees < ActiveRecord::Base
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # full regex

  validates :name, :presence => true
  validates :title, :presence => true
  validates :email, :presence => true, :format => { :with => email_regex }
  validates :phone, :presence => true
  validates :image, :presence => true
end
