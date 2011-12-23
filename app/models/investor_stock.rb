class InvestorStock < ActiveRecord::Base
	#has_many :investors
	#has_many :stocks
	belongs_to :investor
	belongs_to :stock
end
