class FetchStocks
  @queue = :stocks_queue
  def self.perform()
    @stocks = Ystock.find([
      'MAERSK-B.CO', # A.P. Møller Mærsk
      'CARL-B.CO',   # Carlsberg
      'CRTSF.PK',    # Chr. Hansen Holding
      'COLO-B.CO',   # Coloplast
      'DNORD.CO',    # D/S Norden
      'DANSKE.CO',   # Danske Bank
      'DSV.CO',      # DSV
      'FLS.CO',      # FLSmidth & Co
      'GN.CO',       # GN Store Nord
      'LUN.CO',      # H. Lundbeck
      'NKT.CO',      # NKT Holding
      'NOVO-B.CO',   # Novo Nordisk
      'NZYM-B.CO',   # Novozymes
      'PNDORA.Co',   # Pandora
      'SYDB.Co',     # Sydbank
      'TDC.CO',      # TDC
      'TOP.CO',      # Topdanmark
      'TRYG.CO',     # Tryg
      'VWS.CO',      # Vestas
      'WDH.CO'       # William Demant Holding
    ])
    puts "processed job"
  end
end