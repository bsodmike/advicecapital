class Stock < ActiveRecord::Base
	has_many :investor_stocks
	has_many :investors, :through => :investor_stocks

	accepts_nested_attributes_for :investor_stocks
end
