class SessionsController < ApplicationController

  def new
    @title = 'Sign In'
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end

      redirect_to root_url, :notice => "Du er logget ind"
    else
      render "new", :error => "Forkert email eller kodeord."
    end
  
  end

  def destroy
    cookies.delete(:auth_token)
    #sign_out
    redirect_to root_url, :notice => 'Signed out!'
  end

end
