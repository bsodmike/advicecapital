# encoding: utf-8

class Stock < ActiveRecord::Base
	has_many :investor_stocks
	has_many :investors, :through => :investor_stocks

	attr_accessible :value, :month, :year, :date

	accepts_nested_attributes_for :investor_stocks, :allow_destroy => true

	validates :value, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than => 0, :less_than => 9999}

end
