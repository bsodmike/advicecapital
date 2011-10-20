class Investor < ActiveRecord::Base

  letter_regex = /\A[a-zA-Z]+\z/
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  phone_regex = /\A[0-9]+\z/

  validates :name,
            :presence => true,
            :format => { :with => letter_regex, :message => " - Der kan kun bruges bogstaver" },
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
  validates :stocks,
            :presence => false,
            :numericality => true
  validates :entry_stock_price,
            :presence => false,
            :numericality => { :only_integer => false }


end
