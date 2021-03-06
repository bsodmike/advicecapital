class VideosController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource

  def index
    @videos = Panda::Encoding.all
    #Panda.get('/videos.json')
  end

  def show
    @video = get_video(params[:id])
    @original_video = @video.panda_video
    @h264_encoding = @original_video.encodings['h264']
    @ogg_encoding = @original_video.encodings['ogg']
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.create!(params[:video])
    redirect_to :action => :show, :id => @video.id, :only_path => true
  end

  def destroy
		Panda::Video.delete(@video.id)
		@video = Video.where(:panda_video_id => params[:id])
		@video.destroy if @video.exists?


    redirect_to videos_path, :notice => "Video blev slettet."
  end
  
  private
  def get_video(video_id)
    Panda::Video.find(video_id)
  end
end
