class Admin::AdvicePagesController < AdminController

  def edit
    @page = AdvicePage.find(params[:id])
  end

  def update
    @page = AdvicePage.find(params[:id])

    if AdvicePage.where(:slug => @page.slug).update_attributes(params[:page])
      redirect_to(edit_advice_page_path, :notice => 'Page was successfully updated.')
    else
      render :edit
    end
  end

end
