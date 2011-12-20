class Stock < ActiveRecord::Base
	has_many :investors_stocks
	has_many :investors, :through => :investors_stocks
end
