class NewsController < ApplicationController
  before_filter :signed_in_user, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @news = News.all
  end

  def show
    @news = News.find(params[:id])
  end

  def new
    @news = News.new
  end

  def edit
    @news = News.find(params[:id])
  end

  def create
    @news = News.new(params[:news])

    if @news.save
      redirect_to(@news, :notice => 'News was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @news = News.find(params[:id])

    if @news.update_attributes(params[:news])
      redirect_to(@news, :notice => 'News was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy

    respond_to do |format|
      format.html { redirect_to(news_index_url) }
      format.xml  { head :ok }
    end
  end
end
