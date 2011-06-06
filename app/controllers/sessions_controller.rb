class SessionsController < ApplicationController

  def new
    @title = 'Sign In'
  end

  def create
    # Use the authenticate method from the User model along with the parametres of :session to validate the user login
    user = User.authenticate(params[:session][:email], params[:session][:password])
    #user = User.authenticate(params[:email], params[:password])
    
    if user
      session[:user_id] = user.id
      #sign_in user # Signs in the User
      redirect_to users_url, :notice => "Signed in"
      
    else
      flash.now[:error] = "Invalid email/password combination"
      @title = "Sign in"
      render 'new'
    end
  
  end

  def destroy
    session[:user_id] = nil
    #sign_out
    redirect_to root_path, :notice => 'Signed out!'
  end

end
