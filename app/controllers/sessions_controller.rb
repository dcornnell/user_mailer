class SessionsController < ApplicationController
	def new
		session[:user_id] = nil
	end

	def create
		user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
		if user
			session[:user_id] = user.id
			redirect_to user_path(user.id)
		else
			render :new
		end
	end

	def destroy
 		session[:user_id] =nil
 		redirect_to users_path
 	end
end
