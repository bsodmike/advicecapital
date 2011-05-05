class PagesController < ApplicationController

  def index
    @page_title = "Advice Capital A/S - Index"
  end

  def show
    @page_title = @page[:title]
    @page = Pages.find_by_path(request.path)

    #Page.find_by_path(request.path) and will return {:page_title => 'title', :template=> '/pages/about/things.html'}
  end

  def contact
    @page_title = "Advice Capital A/S - Contact"
  end

  # About Advice Capital
  def about_ac
    @page_title = "Om Advice Capital"
  end

  def history
    @page_title = "Historie"
  end

    def concept
      @page_title = "Det star vi for / Vores koncept"
    end

    def results
      @page_title = "Resultater"
    end

    def strategy
      @page_title = "Strategi"
    end

    def we_choosed_ac
      
    end

  # About Advice Invest
  def about_ai
    @page_title = "Advice Invest"
  end

    def purpose
      @page_title = "Form&aring;l"
    end

  # Organisation
  def organisation
    @page_title = "Organisation"
  end

    def employees
      @page_title = "Medarbejdere"
    end

    def staff
      @page_title = "Bestyrelse"
    end

  # Become Client/Customer?
  def become_customer
    @page_title = "Bliv kunde"
  end

    def invest_advice
      @page_title = "Investering i Advice Invest A/S"
    end

    def individual_invest_advice
      @page_title = "Individuel investeringsradgivning"
    end

  # Invest Universe
  def invest_universe
    @page_title = "Investeringsunivers"
  end

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

  # News
  def news
    @page_title = "Nyheder"
  end

  # Investor Login
  def investor_login
    @page_title = "Investor login"
  end

  def rapport
    @page_title = "Modtag Advice Invest kvartalsrapport"
  end
  
  def disclaimer
    @page_title = "Disclaimer"
  end
end
