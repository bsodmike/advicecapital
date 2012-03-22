# encode UTF-8
class PagesController < ApplicationController

  respond_to :html, :json, :js

  def index
    box_portfolio = 1
    box_choose = 2

    @page_title = "Advice Capital A/S - Index"
    @news = News.limit(5).order("updated_at DESC").all
    @employees = Employee.all
    @box_portfolio = Box.find_by_id(box_portfolio)
    @box_choose = Box.find_by_id(box_choose)
    @rss = SimpleRSS.parse open('http://borsen.dk/rss/investor/')
    @video = Video.first
    @original_video = @video.panda_video
    @h264_encoding = @original_video.encodings["h264"]
    @ogg_encoding = @original_video.encodings["ogg"]
  end

  def show
    @page = AdvicePage.where(:slug => request.path).last
    @path = request.path
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
