# encoding: UTF-8
class InvestorPdf < Prawn::Document
	def initialize(investor, view)
		super(top_margin: 70)
		@investor = investor
		@stocks = Stock.all
		name
		chart
	end

	def name
		text "#{@investor.name}", size: 30, style: :bold
	end

	def chart
		stock_value = @stocks.map(&:value)
		stock_month = @stocks.map(&:month)

		text "#{stock_value}"
		stock_value
		stock_month
		text "Aktie kurs #{@investor.entry_rate}"
		text "Værdi ved indtrædelse #{@investor.entry_price}"
		text "Dato for indtrædelse #{@investor.entry_date.strftime('%d/%m/%y')}"
		text "Antal aktier #{@investor.entry_stock_count}"

		#Gchart.line(
		#	:size => '600x300', 
		#	:title => "Aktiekurs", 
		#	:bg => 'fff', 
		#	:legend => 'Aktie Værdi', 
		#	:data => stock_value, 
		#	:axis_with_labels => 'y,x,r', 
		#	:axis_labels => [ stock_value, stock_month, ['2011'] ]
		#)
	end


end