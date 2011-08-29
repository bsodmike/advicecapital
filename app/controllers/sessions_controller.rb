class SessionsController < ApplicationController

  def index
    redirect_to signin_path
  end

  def new
    @title = 'Log ind'
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to root_url, :notice => "Du er nu logget ind"
    else
      flash[:error] = "Forkert email eller kodeord."
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => 'Signed out!'
  end

end
