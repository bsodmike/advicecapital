# encode UTF-8
class PagesController < ApplicationController
  caches_page :index
  respond_to :html, :json, :js

  def index
    box_portfolio = 1
    box_choose = 2

    @page_title = "Advice Capital A/S - Index"
    @news = News.limit(5).order("date DESC").all
    @employees = Employee.all
    @box_portfolio = Box.find_by_id(box_portfolio)
    @box_choose = Box.find_by_id(box_choose)
    @rss = SimpleRSS.parse open('http://borsen.dk/rss/investor/')
    @video = Video.first
    
    unless @video.nil? 
      @original_video = @video.panda_video
      @h264_encoding = @original_video.encodings["h264"] 
      @ogg_encoding = @original_video.encodings["ogg"]
    end
      
  end

  def show
    @page = AdvicePage.where(:slug => request.path).last
    @path = request.path
  end

end
