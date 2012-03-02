# encoding: UTF-8
class InvestorPdf < Prawn::Document
	def initialize(investor, view)
		super(top_margin: 70)
		@investor = investor
		@stocks = Stock.all
		@company_stocks = CompanyStock.first
		
		# Sections
		name
		info
		chart
	end

	def name
		text "#{@investor.name}", size: 30, style: :bold
	end

	def info
		text "Aktie kurs ved indtrædelse: #{@investor.entry_rate}"
		text "Nuværende aktiekurs: #{@investor.current_rate}"
		text "Værdi ved indtrædelse: #{@investor.entry_price} kr."
		text "Dato for indtrædelse: #{@investor.entry_date.strftime('%d/%m/%y')}"
		text "Antal aktier: #{@investor.entry_stock_count}"
	end

	def chart
		stock_value = @stocks.map(&:value)
		stock_month = @stocks.map(&:month)


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