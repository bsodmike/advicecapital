require 'digest'

class User < ActiveRecord::Base
  attr_accessor :password # creates a virtual password attribute, only to use in memory
  attr_accessible :name, :email, :password, :password_confirmation  # enables the :name and :email attribute to be accessible

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # full regex

  validates :name, :length => { :maximum => 50 },
                   :presence => true # a validation of :name has to be present and a max character length of 50

  validates :email, :format => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }, # email has to be unique, and it does not effect if case
                    :presence => true

  validates :password, :presence => true,
                       :confirmation => true, # it needs a confirmation
                       :length => { :within => 6..40 }  # the length has to be WITHIN 6-40 characters

  before_save :encrypt_password

  # Return true if the submitted password matches the users password
  def has_password?(submitted_password)
    # Compare the encrypted_password with the encrypted version of submitted_password
    encrypted_password == encrypt(submitted_password)
  end

  # Authenticate with email and password combination
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  # authenticates the user again, if a cookie is saved
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    return nil if user.nil?
    (user && user.salt == cookie_salt) ? user : nil
  end

  private

    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
