class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def show
		@user = User.find(:id)
	end
	def new
		@user = User.new
	end
	def create
		@user = User.create(user_params)
		if @user.save
			redirect_to users_path
		else
			render :new
		end
	end
	def edit
	end
	def update
	end
	def destroy
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
