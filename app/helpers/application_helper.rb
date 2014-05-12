module ApplicationHelper
	
	def show_name(name)
		user = User.find(name)
		user.name
	end
		
end
