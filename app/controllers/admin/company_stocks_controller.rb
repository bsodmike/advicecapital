# encoding: UTF-8
class Admin::CompanyStocksController < AdminController
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
