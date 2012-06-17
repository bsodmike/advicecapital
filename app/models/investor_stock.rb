class InvestorStock < ActiveRecord::Base
  attr_accessible :investor_id
  attr_accessible :stock_id
  
	#has_many :investors
	#has_many :stocks
	belongs_to :investor
	belongs_to :stock
end
