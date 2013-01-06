# encode UTF-8
class PagesController < ApplicationController
  caches_page :index
  respond_to :html, :json, :js

  def index
    box_portfolio = "frontpage_portfolio"
    box_choose = "frontpage_choose"

    @page_title = "Advice Capital A/S - Index"
    @news = News.limit(5).order("date DESC").all
    @employees = Employee.all
    @box_portfolio = get_box_id(box_portfolio)
    @box_choose = get_box_id(box_choose)
    #@rss = SimpleRSS.parse open('http://borsen.dk/rss/investor/')
		@rss = Feedzirra::Feed.fetch_and_parse('http://borsen.dk/rss/investor/')
    @video = Video.where("frontpage", true).first
    @frontpage_video = get_box_id("frontpage_video")

    unless @video.nil? 
      @original_video = @video.panda_video
      @h264_encoding = @original_video.encodings["h264"] 
      @ogg_encoding = @original_video.encodings["ogg"]
    end
      
  end

  def show
    @page = AdvicePage.where(:slug => request.path).last

    # IDS
    box_about_ac_first = "pages_about_ac_first"
    box_about_ac_second = "pages_about_ac_second"
    box_products_first = "pages_products_first"
    box_products_second = "pages_products_second"
    box_invest_universe_first = "pages_invest_universe_first"
    box_invest_universe_second = "pages_invest_universe_second"
    box_become_customer_first = "pages_become_customer_first"
    box_become_customer_second = "pages_become_customer_second"

    @box_about_ac_first = get_box_id(box_about_ac_first)
    @box_about_ac_second = get_box_id(box_about_ac_second)
    @box_products_first = get_box_id(box_products_first)
    @box_products_second = get_box_id(box_products_second)
    @box_invest_universe_first = get_box_id(box_invest_universe_first)
    @box_invest_universe_second = get_box_id(box_invest_universe_second)
    @box_become_customer_first = get_box_id(box_become_customer_first)
    @box_become_customer_second = get_box_id(box_become_customer_second)

    @path = request.path
  end

  private 

  def get_box_id(value)
    Box.find_by_name(value)
  end


end
