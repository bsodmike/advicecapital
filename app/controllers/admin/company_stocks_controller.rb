# encoding: UTF-8
class Admin::CompanyStocksController < AdminController
	load_and_authorize_resource

	def index
		@company_stocks = CompanyStock.all
	end

	def new
		@company_stock = CompanyStock.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @company_stock }
		end
	end

	def create
		@company_stock = CompanyStock.new(params[:company_stock])
		if @company_stock.save
			redirect_to admin_stock_url(@company_stock), notice: 'Comapny Stock was successfully created.'
		else
			render :new
		end
	end

  def show
  	@company_stocks = get_company_stock_first
  end

  def edit
  	@company_stocks = get_company_stock_first
  end

  def update
  	@company_stocks = get_company_stock_first

    if @company_stocks.update_attributes(params[:company_stocks])
      redirect_to admin_company_stock_path(@company_stocks), :notice => "Firmaværdier blev opdateret."
    else
      render :edit
    end
  end
  
  private


  def get_company_stock_first
    CompanyStock.first
  end
end
