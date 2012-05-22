class Admin::AdvicePagesController < AdminController
  
  def index
    @pages = AdvicePage.all
  end
  
  def show
    @page = get_page(params[:id])
  end

  def edit
    @page = get_page(params[:id])
  end

  def update
    @page = get_page(params[:id])

    if @page.update_attributes(params[:advice_page])
      redirect_to admin_advice_pages_path, :notice => 'Page was successfully updated.'
    else
      redirect_to edit_admin_advice_page(@page.id)
    end
  end
  
  private
  def get_page(page_id)
    AdvicePage.find(page_id)
  end

end
