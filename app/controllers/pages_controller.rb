# encode UTF-8
class PagesController < ApplicationController
  
  def index
    @page_title = "Advice Capital A/S - Index"
    @news = News.all

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

    @stocks_n = ([
      'A.P. Moeller Maersk',
      'Carlsberg',
      'Chr. Hansen Holding',
      'Coloplast',
      'D/S Norden',
      'Danske Bank',
      'DSV',
      'FLSmidth & Co',
      'GN Store Nord',
      'H. Lundbeck',
      'NKT Holding',
      'Novo Nordisk',
      'Novozymes',
      'Pandora A/S',
      'Sydbank',
      'TDC',
      'Topdanmark',
      'Tryg',
      'Vestas Wind Systems',
      'William Demant Holding'
    ])


  end

  def show
    @page = AdvicePages.find_by_path(request.path)
    @page_title = @page[:title]
    
    render @page[:template]
    #Page.find_by_path(request.path) and will return {:page_title => 'title', :template=> '/pages/about/things.html'}
  end

  def contact
    @page_title = "Advice Capital A/S - Contact"
  end

  def employees
    @page_title = "Medarbejdere"
  end

  def staff
    @page_title = "Bestyrelse"
  end

  # Become Client/Customer?
  #def become_customer
    #@page_title = "Bliv kunde"
  #end

  def invest_advice
    @page_title = "Investering i Advice Invest A/S"
  end

  def individual_invest_advice
    @page_title = "Individuel investeringsradgivning"
  end

  # Invest Universe

  def stocks
    @page_title = "Aktier"
  end

  def company_bonds
    @page_title = "Virksomhedsobligationer"
  end

  def bonds
    @page_title = "Obligationer"
  end

  def valuta
    @page_title = "Valuta"
  end

  def rapport
    @page_title = "Modtag Advice Invest kvartalsrapport"
  end
end
