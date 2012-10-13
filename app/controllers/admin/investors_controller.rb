class Admin::InvestorsController < AdminController
  def index
    @investors = Investor.all
  end

  def show
    @investor = get_investor(params[:id])

    unless @investor.entry_date.nil?
			@entry_date = @investor.entry_date.strftime("%d/%m/%y")
      @entry_date_month = @investor.entry_date.strftime("%_m").to_s
      @entry_date_year = @investor.entry_date.strftime("%Y").to_s
    end

		@stocks = Stock.where("date >= ?", @investor.entry_date).page(params[:page]).per(12)

		startOfYear = DateTime.new(DateTime.now.year, 01, 01)
	  endOfYear = DateTime.new(DateTime.now.year, 12, 31)

		@stocks_current_year = Stock.where(date: startOfYear..endOfYear)
    @stocks_chart = Stock.where("date >= ?", @investor.entry_date)

    @profile = @investor.users
    @throwoff = @investor.current_rate.to_i - @investor.entry_rate.to_i# * @investor.entry_stock_count
    @throwoffValue = (@stocks.last.value - @stocks.first.value) * @investor.entry_stock_count
		@throwoffPercent = ((@stocks.last.value - @stocks.first.value) / @stocks.first.value * 100)

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
    @investor = get_investor(params[:id])
  end

  def update
    @investor = get_investor(params[:id])

		if @investor.update_attributes(params[:investor])
			redirect_to admin_investor_path(@investor), :notice => "Investor was successfully updated."
		else
			render :edit
		end
  end

  def destroy
    @investor = get_investor(params[:id])
    @investor.destroy
    redirect_to admin_investors_path, :notice => "Investor was successfully deleted."
	end

	def tax_account
		@investor = get_investor(params[:id])

		respond_to do |format|
			format.html
		end
	end
  
  private 
  def get_investor(investor_id)
    Investor.find(investor_id)
  end

end
