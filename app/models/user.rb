class User < ActiveRecord::Base
  ROLES = %w(visitor investor admin super_admin) 
  
  attr_accessible :name, :email, :password, :password_confirmation, :role
  
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

  def role?(role)
    current_user.role
  end

  def admin?
    ['admin', 'super_admin'].include? self.role
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
