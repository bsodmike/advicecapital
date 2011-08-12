class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  helper_method :current_user, :signed_in_user, :admin_user

    def signed_in_user
      if current_user.nil?
        redirect_to signin_path, :notice => "Please sign in to access this page"
      end
    end
    
    def current_user
      @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    end

    def admin_user
      #if current_user.admin?
      flash[:error] = "You don't have permission to view users"
      redirect_to(root_path) unless current_user.admin?
      #end
    end

end
