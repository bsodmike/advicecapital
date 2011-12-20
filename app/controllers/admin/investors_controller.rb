class Admin::InvestorsController < AdminController
  def index
    @investors = Investor.all
  end

  def show
    @investor = Investor.find(params[:id])
    #@stocks = @investor.stocks
    #@stocks = @investor.investors_stocks.stocks

    respond_to do |format|
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
    @investor = Investor.find(params[:id])
  end

  def update
    @investor = Investor.find(params[:id])

    if @investor.update_attributes(params[:investor])
      redirect_to @investor, :notice => "Investor was successfully updated."
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
