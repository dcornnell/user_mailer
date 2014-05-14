class UsersController < ApplicationController
	def index
		

	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@new_user = User.new
	end

	def create
		@new_user = User.new(user_params)
		if @new_user.save
			redirect_to login_path
		else
			render :new
		end
	end

	

	private

	def user_params
		params.require(:user).permit!
	end
end