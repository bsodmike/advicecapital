module SessionsHelper

  #def current_user
    #@current_user ||= user_from_remember_token
  #end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?(user)
    user == current_user
  end

#  def sign_in(user)
#    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
#    self.current_user = user # Sets the current_user object to the user object
#  end

#  def current_user=(user)
#    @current_user = user
#  end

  # Signs the user out
#  def sign_out
#    cookies.delete(:remember_token) # Deletes the cookie :remember_token
#    self.current_user = nil # sets the current_user object to nil
#  end

  def signed_in?
    !current_user.nil?
  end

  def signed_in_user
    if signed_in?
      flash[:error] = "You cannot create a user while signed in"
      redirect_to users_path
    end
  end

  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page" # A shortcut to put a message in flash[:notice] with redirect_to, also works with :error but not :success
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def logged_in?
    session[:user_id].present?
  end

  def get_user_id
    session[:user_id] if logged_in?
  end

  def admin?
    User.find_by_id(get_user_id).admin? if logged_in?
  end

  private

#    def user_from_remember_token
#      User.authenticate_with_salt(*remember_token)
#    end
#
#    def remember_token
#      cookies.signed[:remember_token] || [nil, nil]
#    end
#
#    def clear_return_to
#      session[:return_to] = nil
#    end
end
