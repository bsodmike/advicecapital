class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation

  attr_accessor :password # creates a virtual password attribute, only to use in memory
  before_save :encrypt_password
  
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

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
