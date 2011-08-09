class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # full regex

  validates :name, :length => { :maximum => 50 },
                   :presence => true # a validation of :name has to be present and a max character length of 50

  validates :email, :format => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }, # email has to be unique, and it does not effect if case
                    :presence => true

  validates :password, :presence => true,
                       :on => :create,
                       :confirmation => true, # it needs a confirmation
                       :length => { :within => 6..40 }  # the length has to be WITHIN 6-40 characters
                       
  before_create { generate_token(:auth_token) }

  has_secure_password

end
