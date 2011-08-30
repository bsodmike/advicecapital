class ApplicationController < ActionController::Base
  protect_from_forgery
  force_ssl
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Du har ikke rettigheder til dette."
    redirect_to root_url
  end

  private
  helper_method :current_user, :signed_in_user

  def signed_in_user
    if current_user.nil?
      redirect_to signin_path, :notice => "Please sign in to access this page"
    end
  end
  
  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

end
