class Admin::CompanyStocksController < AdminController
  def show
  	@company_stocks = CompanyStock.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def edit
  	@company_stocks = CompanyStock.find(params[:id])
  end

  def update
  	@company_stocks = CompanyStock.find(params[:id])

    if @company_stocks.update_attributes(params[:company_stocks])
      redirect_to @company_stocks, :notice => "Investor was successfully updated."
    else
      render :edit
    end
  end
end
