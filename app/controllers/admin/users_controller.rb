class Admin::UsersController < AdminController
	load_and_authorize_resource

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
		email_changed = @user.email != params[:user][:email]
		password_changed = !params[:user][:password].empty?

		successfully_updated = if email_changed or password_changed
														 @user.update_with_password(params[:user])
													 else
														 @user.update_without_password(params[:user])
													 end

		if successfully_updated
			# Sign in the user bypassing validation in case his password changed
			sign_in @user, :bypass => true
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