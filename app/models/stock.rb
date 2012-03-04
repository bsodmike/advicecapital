class Stock < ActiveRecord::Base
	has_many :investor_stocks
	has_many :investors, :through => :investor_stocks

	attr_accessible :value, :month, :year

	accepts_nested_attributes_for :investor_stocks, :allow_destroy => true
end
