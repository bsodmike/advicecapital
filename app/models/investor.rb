class Investor < ActiveRecord::Base

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  phone_regex = /\A[0-9]+\z/

  validates :name,
            :presence => true,
            :uniqueness => true
  validates :entry_date,
            :presence => false
  validates :email,
            :presence => false,
            :format => { :with => email_regex },
            :uniqueness => true
  validates :phone,
            :presence => false,
            :numericality => true
            #:format => { :with => phone_regex }
  validates :entry_stock_price,
            :presence => false,
            :numericality => { :only_integer => false }

  has_many :investor_stocks
  has_many :stocks, :through => :investor_stocks       


end
