class User < ActiveRecord::Base
	has_secure_password
	validates_presence_of :email
	validates_uniqueness_of :email
	after_create :send_new_user
	
	def send_new_user
		NewUserMailer.send_new_user(self)
	end
end