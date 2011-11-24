class Admin::AdvicePagesController < AdminController
  
  def index
    @pages = AdvicePage.all
  end
  
  def show
    @page = AdvicePage.find(params[:id])
  end

  def mercury_update
    page = AdvicePage.find(params[:id])
    page.name = params[:content][:page_title][:value]
    page.content = params[:content][:page_content][:value]
    page.save!
    render text: ""
  end

  def edit
    @page = AdvicePage.find(params[:id])
  end

  def update
    @page = AdvicePage.find(params[:id])

    if @page.update_attributes(params[:advice_page])
      redirect_to admin_advice_pages_path, :notice => 'Page was successfully updated.'
    else
      redirect_to edit_admin_advice_page(@page.id)
    end
  end

end
