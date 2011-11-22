class Admin::UsersController < AdminController
	load_and_authorize_resource


	def index
		@users = User.all # Shows all users except current_users
	end

	def show
		# @user = current_user
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new

		if @user.save
			redirect_to admin_users, :notice => "Brugeren blev oprettet."
		else
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update_attributes(params[:user])
			redirect_to admin_user_path(@user), :notice => "Brugeren blev opdateret."
		else
			render :edit
		end

	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			redirect_to admin_users_path, :notice => "Brugeren blev slettet."
		end
	end

	

end