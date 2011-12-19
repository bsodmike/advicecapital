class InvestorStock < ActiveRecord::Base
	belongs_to :investor
	belongs_to :stock
end
