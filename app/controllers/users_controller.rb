class UsersController < ApplicationController

  before_filter :signed_in_user, :only => [ :show, :edit, :update, :destroy, :index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      #sign_in @user
      cookies[:auth_token] = @user.auth_token
      redirect_to @user, :success => "Brugeren er oprettet!"
    else
      render 'new', :error => "Brugeren kunne ikke oprettes"
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(users_url)
  end

end
