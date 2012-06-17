class StockData < ActiveRecord::Base
  attr_accessible :symbol, :change, :value, :price
end
