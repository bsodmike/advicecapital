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
		User.new
	end

	def create
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			redirect_to admin_users_path, :notice => "Brugeren blev slettet."
		end
	end

	

end