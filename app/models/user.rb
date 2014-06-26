class User < ActiveRecord::Base
	has_secure_password
	validates_presence_of :email
	validates_uniqueness_of :email
	validates_presence_of :name
	after_create :send_new_user
	before_destroy :check_destroyable

	def days_around
		(Date.today.to_date - self.created_at.to_date).to_i
	end

	def make_industructable
		self.destroyable = false

	end

	
	def check_destroyable
		if self.destroyable == true
			return true
		elsif self.destroyable == nil
			return false
		else
			return false
		end
	end
	
	def send_new_user
		NewUserMailer.send_new_user(self)
	end
end