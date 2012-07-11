# encoding: utf-8
desc "rake task to update stock info from Yahoo"
task :stock_info_update  => :environment do
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
    'PNDORA.CO',   # Pandora
    'TDC.CO',      # TDC
    'TOP.CO',      # Topdanmark
    'TRYG.CO',     # Tryg
    'VWS.CO',      # Vestas
    'WDH.CO'       # William Demant Holding
  ])
  
  stock_data.each do |key, hash|
    StockData.where(:symbol => hash[:symbol]).last.update_attributes(:price => hash[:price], :change => hash[:change],:volume => hash[:volume])
  end  
  
  puts "Rake[:stock_info_update] => StockData updated at #{Time.now.strftime("%D @ %H%M %z")}"
end