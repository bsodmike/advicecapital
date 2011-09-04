class NewsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  respond_to :html

  def index
    respond_with(@news = News.order("updated_at").page(params[:page]).per(10))
  end

  def show
    respond_with(@news = News.find(params[:id]))
  end

  def new
    respond_with(@news = News.new)
  end

  def edit
    respond_with(@news = News.find(params[:id]))
  end

  def create
    @news = News.new(params[:news])

    if @news.save
      respond_with(@news) do |format|
        format.html { redirect_to(@news, :notice => 'News was successfully created.') }
      end
    else
      render :new
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
