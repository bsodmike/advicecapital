# encoding: utf-8
class Admin::StocksController < AdminController

  def index
    @stocks = Stock.order(:year, :month).page(params[:page]).per(12)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stocks }
    end
  end

  def show
    @stock = get_stock(params[:id])
    @stocks = Stock.all
    @stock_value = @stocks.map(&:value)
    @stock_month = @stocks.map(&:month)
    @stock_year = @stocks.map(&:year)
    #@month_year = @stock_month.concat("/" + @stock_year)
  end

  def new
    @stock = Stock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stock }
    end
  end

  def edit
    @stock = get_stock(params[:id])
  end

  def create
    @stock = Stock.new(params[:stock])
    if @stock.save
      redirect_to admin_stock_url(@stock), notice: 'Stock was successfully created.'
    else
      render :new
    end
  end

  def update
    @stock = get_stock(params[:id])

    if @stock.update_attributes(params[:stock])
      redirect_to admin_stock_url(@stock), notice: 'Stock was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @stock = get_stock(params[:id])
    @stock.destroy

    redirect_to admin_stocks_url
  end

  private
  def get_stock(stock_id)
    Stock.find(stock_id)
  end
end
