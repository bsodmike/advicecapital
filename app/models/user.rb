class User < ActiveRecord::Base
  ROLES = %w(visitor employee investor admin super_admin)
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :role, :investor_id

	validates :investor_id, :uniqueness => true, :allow_blank => true, :allow_nil => true

  def admin?
    ['admin', 'super_admin'].include? self.role
  end

  def super_admin?
    self.role == 'super_admin'
  end

  def investor?
    self.role == 'investor'
  end

  has_one :investor
end
