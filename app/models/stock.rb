class Stock < ActiveRecord::Base
	has_many :investor_stocks
	has_many :investors, :through => :investor_stocks
end
