class Investor < ActiveRecord::Base
  
  attr_accessible :name, :email, :phone, :entry_stock_price, :entry_stock_count, :entry_price, :entry_rate, :entry_date, :tax_note_link, :investor_type

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  phone_regex = /\A[0-9]+\z/

  validates :name,
            :presence => true,
            :uniqueness => true
  validates :email,
            :presence => true,
            :format => { :with => email_regex },
            :uniqueness => true
  validates :phone,
            :presence => true,
            :numericality => true
            #:format => { :with => phone_regex }
  validates :entry_stock_price,
            :numericality => true,
            :presence => false
  validates :entry_stock_count,
            :presence => true,
            :numericality => true
  validates :entry_price,
            :presence => true,
            :numericality => true
  validates :entry_rate,
            :presence => true,
            :numericality => true
	validates :entry_date,
						:presence => true

  #has_many :investor_stocks
  #has_many :stocks, :through => :investor_stocks

  has_many :investor_profiles
  has_many :users, :through => :investor_profiles

  #accepts_nested_attributes_for :stocks, :reject_if => lambda { |a| a[:value].blank? }, :allow_destroy => true
  
end
