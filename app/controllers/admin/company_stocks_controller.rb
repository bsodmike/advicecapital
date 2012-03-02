# encoding: UTF-8
class Admin::CompanyStocksController < AdminController
  def show
  	@company_stocks = CompanyStock.first

    respond_to do |format|
      format.html
    end
  end

  def edit
  	@company_stocks = CompanyStock.first
  end

  def update
  	@company_stocks = CompanyStock.first

    if @company_stocks.update_attributes(params[:company_stocks])
      redirect_to admin_company_stock_path(@company_stocks), :notice => "Firmaværdier blev opdateret."
    else
      render :edit
    end
  end
end
