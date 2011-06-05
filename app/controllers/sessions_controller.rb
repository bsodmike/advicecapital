class SessionsController < ApplicationController

  def new
    @title = 'Sign In'
  end

  def create
    # Use the authenticate method from the User model along with the parametres of :session to validate the user login
    #user = User.authenticate(params[:session][:email], params[:session][:password])
    user = User.authenticate(params[:email], params[:password])

    if user.nil?
      flash.now[:error] = "Invalid email/password combination"
      @title = "Sign in"
      render 'new'
    else
      sign_in user # Signs in the User
      redirect_back_or user
    end

  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
