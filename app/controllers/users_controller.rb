class UsersController < ApplicationController
  #load_and_authorize_resource
  respond_to :html
  before_filter :authenticate_user!, :only => [ :show, :edit, :update, :destroy, :index]

  def index
    respond_with(@users = User.all)
  end

  def show
    respond_with(@user = User.find(params[:id]))
  end

  def new
    respond_with(@user = User.new)
  end

  def edit
    respond_with(@user = User.find(params[:id]))
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      #sign_in @user
      cookies[:auth_token] = @user.auth_token
      redirect_to @user, :success => "Brugeren er oprettet!"
    else
      render :new, :error => "Brugeren kunne ikke oprettes"
    end
  end

  def update
    @user = User.find(params[:id])

    respond_with @user do |format|
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
