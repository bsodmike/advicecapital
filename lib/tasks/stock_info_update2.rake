# encoding: utf-8
desc "rake task to update stock info from Yahoo"
task :stock_info_update  => :environment do
	stocks = StockQuote::Stock.quote("
		aapl, 
		google
	")