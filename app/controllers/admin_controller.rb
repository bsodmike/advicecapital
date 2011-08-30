class AdminController < ApplicationController
  before_filter :signed_in_user
  before_filter do 
    redirect_to '/' unless current_user && ['investor', 'admin', 'super_admin'].include?(current_user.role)
  end

  def index
  end

end
