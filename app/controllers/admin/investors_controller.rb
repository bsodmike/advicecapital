class Admin::InvestorsController < AdminController
  def index
    @investors = Investor.all
  end

  def show
    @investor = get_investor(params[:id])
    @entry_date_month = @investor.entry_date.strftime("%_m").to_s
    @entry_date_year = @investor.entry_date.strftime("%Y").to_s


    @stocks = Stock.where("month >= ? AND year >= ?", @entry_date_month, @entry_date_year)
    @profile = @investor.users

    @throwoff = @investor.current_rate.to_i - @investor.entry_rate.to_i# * @investor.entry_stock_count
    @throwoffValue = @throwoff * @investor.entry_stock_count
    @throwoffPercent = @throwoff / @investor.entry_rate.to_i

    @stock_value = @stocks.map(&:value)
    @stock_month = @stocks.map(&:month)
    @stock_year = @stocks.map(&:year)


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
    #@investor.stocks.build
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
    
    respond_to do |format|
      if @investor.update_attributes(params[:investor])
        redirect_to admin_investor_path(@investor), :notice => "Investor was successfully updated."
      else
        render :edit
      end
    end    
  end

  def destroy
    @investor = get_investor(params[:id])
    @investor.destroy
    redirect_to admin_investors_path, :notice => "Investor was successfully deleted."
  end
  
  private 
  def get_investor(investor_id)
    Investor.find(investor_id)
  end

end
