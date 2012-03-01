class ApplicationController < ActionController::Base
  protect_from_forgery
  #force_ssl
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Du har ikke rettigheder til dette."
    redirect_to root_url
  end

  
  #@current_investor = Investor.where(:user_id => current_user) if current_user

end
