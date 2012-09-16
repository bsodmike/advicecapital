# encoding: utf-8

class Stock < ActiveRecord::Base
	has_many :investor_stocks
	has_many :investors, :through => :investor_stocks

	attr_accessible :value, :month, :year

	accepts_nested_attributes_for :investor_stocks, :allow_destroy => true

	validates :value, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than => 0, :less_than => 9999}

	def self.generate_stock_chart(value, month, year)
    unless value.empty?
      chart = Gchart.line do |g|
        g.size = '600x300'
        g.title = "Kursudvikling for Advice Invest A/S"
        g.bg = 'fff'
        g.data = [value]
        g.axis_with_labels = 'x'

        g.axis(:left) do |a|
          a.range = 450..1100
        end

        g.line_colors = "FF0000"
        g.axis_labels = ['Jan','Feb','Mar','Apr','Maj','Juni','Juli','Aug','Sep','Okt','Nov','Dec']
      end
    end

    return chart
  end

end
