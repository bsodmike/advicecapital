class NewsController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :js

  def index
    respond_with(@news = News.order("updated_at DESC").page(params[:page]).per(10))
  end

  def show
    respond_with(@news = get_news)
  end

  def new
    respond_with(@news = News.new)
  end

  def edit
    respond_with(@news = get_news)
  end

  def create
    @news = News.new(params[:news])

    if @news.save
      redirect_to @news, :notice => 'News was successfully created.'
    else
      render :new
    end
  end

  def update
    @news = get_news

    if @news.update_attributes(params[:news])
      redirect_to @news, :notice => 'News was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @news = get_news
    @news.destroy
  end
  
  private
  def get_news
    News.find(params[:id])
  end
end
