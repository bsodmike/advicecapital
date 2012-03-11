class Admin::InvestorsController < AdminController
  def index
    @investors = Investor.all
  end

  def show
    @investor = Investor.find(params[:id])
    @investorStocks = @investor.stocks
    @stocks = Stock.all
    @profile = @investor.users

    @throwoff = @investor.current_rate.to_i - @investor.entry_rate.to_i# * @investor.entry_stock_count
    @throwoffValue = @throwoff * @investor.entry_stock_count
    @throwoffPercent = @throwoff / @investor.entry_rate.to_i

    @stock_value = @stocks.map(&:value)
    @investor_stock_value = @investorStocks.map(&:value)
    @stock_month = @stocks.map(&:month)
    @stock_year = @stocks.map(&:year)

    @array = 0..300

    respond_to do |format|
      format.html
      format.pdf do
        pdf = InvestorPdf.new(@investor, view_context)
        send_data pdf.render, filename: "investor_#{@investor}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
        end
    end
  end

  def new
    @investor = Investor.new
    @investor.stocks.build
  end

  def create
    @investor = Investor.new(params[:investor])

    if @investor.save
      redirect_to admin_investors_path, :notice => "Investor was successfully created."
    else
      render :new
    end
  end

  def edit
    @investor = Investor.find(params[:id])
  end

  def update
    @investor = Investor.find(params[:id])

    #raise @investor.to_yaml

    if @investor.update_attributes(params[:investor])
      redirect_to admin_investor_path(@investor), :notice => "Investor was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @investor = Investor.find(params[:id])
    @investor.destroy
    redirect_to admin_investors_path, :notice => "Investor was successfully deleted."
  end

end
