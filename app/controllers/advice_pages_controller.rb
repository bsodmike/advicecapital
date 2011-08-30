class AdvicePagesController < ApplicationController
  before_filter :signed_in_user, :only => [:edit, :update]
  before_filter :super_admin, :only => [:edit, :update]

  def edit
    @page = AdvicePages.find(params[:id])
  end

  def update
    @page = AdvicePages.find(params[:id])

    if @page.update_attributes(params[:page])
      redirect_to(@page, :notice => 'Page was successfully updated.')
    else
      render :edit
    end
  end

end
