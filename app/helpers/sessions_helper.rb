module SessionsHelper

	# Save user data of logged-in user. Prevent repeated database hits
	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		end
	end

	# Check if user is logged in
	def logged_in?
		session[:user_id] != nil
	end

	# Nullify current user data when user logs out
	def delete_current_user
		@current_user = nil
	end

	# Check if user is accessing own pages
	# Mainly used for rendering partials on certain pages
	def me?
		session[:user_id] == @user.id.to_s
	end
end