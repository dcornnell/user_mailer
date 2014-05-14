class User < ActiveRecord::Base
	has_secure_password
	validates_presence_of :email
	validates_uniqueness_of :email
	validates_presence_of :name
	after_create :send_new_user
	before_destroy :check_destroyable


	def check_destroyable
		if self.destroyable == true
			return true
		else
			return false
		end
	end
	
	def send_new_user
		NewUserMailer.send_new_user(self)
	end
end