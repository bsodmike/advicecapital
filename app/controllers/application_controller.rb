class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  private
  
  def signed_in_user
    if current_user.nil?
      redirect_to signin_path, :notice => "Please sign in to access this page"
    end
  end

  def admin_user
    #if current_user.admin?
    flash[:error] = "You don't have permission to view users"
    redirect_to(root_path) unless current_user.admin?
    #end
  end

end
