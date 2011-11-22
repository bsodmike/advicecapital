class Admin::UsersController < AdminController
	load_and_authorize_resource

	def index
		@users = User.all # Shows all users except current_users
	end

	def new
	end

	def show
		@user = current_user
	end

end