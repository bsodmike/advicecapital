class Admin::UsersController < AdminController

	def index
		@users = User.all # Shows all users except current_users
	end

	def show
		@user = get_user(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		
		if @user.save
			redirect_to admin_users_path(@user), :notice => "Brugeren blev oprettet."
		else
			render :new
		end
	end

	def edit
		@user = get_user(params[:id])
	end

	def update
		@user = get_user(params[:id])

		if @user.update_attributes(params[:user])
			redirect_to admin_users_path, :notice => "Brugeren blev opdateret."
		else
			render :edit
		end
	end

	def destroy
		@user = get_user(params[:id])
		if @user.destroy
			redirect_to admin_users_path, :notice => "Brugeren blev slettet."
		end
	end
	
	private
	def get_user(user_id)
	  User.find(user_id)
  end
end