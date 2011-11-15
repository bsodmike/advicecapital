class VideosController < ApplicationController
  before_filter :authenticate_user!, :except => :index

  def index
    @videos = Panda.get('/videos.json')
  end

  def show
    @video = Video.find(params[:id])
    @original_video = @video.panda_video
    @h264_encoding = @original_video.encodings['h264']
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.create!(params[:video])
    redirect_to :action => :show, :id => @video.id
  end

end
