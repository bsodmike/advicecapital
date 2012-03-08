class Admin::UsersController < AdminController

	def index
		@users = User.all # Shows all users except current_users
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		#raise @user.to_yaml
		if @user.save
			redirect_to admin_users_path(@user), :notice => "Brugeren blev oprettet."
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
			redirect_to admin_users_path, :notice => "Brugeren blev opdateret."
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