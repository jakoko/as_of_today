module SessionsHelper
	def current_user
		if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		end
	end

	def logged_in?
		session[:user_id] != nil
	end

	def delete_current_user
		@current_user = nil
	end

	def me?
		session[:user_id] == @user.id.to_s
	end
end