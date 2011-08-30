class AdvicePagesController < ApplicationController
  before_filter :signed_in_user, :only => [:edit, :update]

  def edit
    @page = AdvicePage.find(params[:id])
  end

  def update
    @page = AdvicePage.find(params[:id])

    if AdvicePage.where( :slug => @page.slug).updateattributes(params[:form_data])
      redirect_to(@page, :notice => 'Page was successfully updated.')
    else
      render :edit
    end
  end

end
