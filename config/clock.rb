require 'clockwork'
require File.expand_path('../config/boot', File.dirname(__FILE__))
require File.expand_path('../config/environment', File.dirname(__FILE__))


module Clockwork
  stock_data = Ystock.find([
    'MAERSK-A.CO', # A.P. Møller Mærsk A
    'MAERSK-B.CO', # A.P. Møller Mærsk B
    'CARL-B.CO',   # Carlsberg
    'CHR.CO',      # Chr. Hansen Holding
    'COLO-B.CO',   # Coloplast
    'DANSKE.CO',   # Danske Bank
    'DSV.CO',      # DSV
    'FLS.CO',      # FLSmidth & Co
    'GN.CO',       # GN Store Nord
    'LUN.CO',      # H. Lundbeck
    'NKT.CO',      # NKT Holding
    'NDA-DKK.CO',  # Nordea Bank
    'NOVO-B.CO',   # Novo Nordisk
    'NZYM-B.CO',   # Novozymes
    'SYDB.Co',     # Sydbank
    'TDC.CO',      # TDC
    'TOP.CO',      # Topdanmark
    'TRYG.CO',     # Tryg
    'VWS.CO',      # Vestas
    'WDH.CO'       # William Demant Holding
  ])

  every(5.minutes, 'stock_data.update') do
    
    stock_data.each do |hash|
      StockData.where(:symbol => hash[:symbol]).last.update_attributes(:price => hash[:price], :change => hash[:change],:volume => hash[:volume])
    end  

    puts "StockData updated at #{Time.now.strftime("%D @ %H%M %z")}"
  end
end


