class UsersController < ApplicationController
	def index
		@users = User.all

	end

	def show
		@user = User.find(params[:id])
		@days = @user.days_around
		if @days > 10
			@user.make_industructable
			@user.save
		end
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

	def destroy
		@user = User.find(params[:id])
		if @user.destroy 
			respond_to do |format|
				format.js
				format.html { redirect_to users_path }
			end
		else
			respond_to do |format|
				format.js {render plain: "0"}
				format.html {redirect_to users_path}
			end
		end
	end

	

	private

	def user_params
		params.require(:user).permit!
	end
end