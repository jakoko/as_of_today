class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:user_id])
	end

	def new
		@user = User.new()
	end

	def create
		@user = User.new(user_params)

		if user_params[:password] == user_params[:password_confirmation]
			if @user.save
				session[:user_id] = @user.id.to_s
	      		redirect_to user_path(@user), :notice => "Account Created"
	    	else
	      		flash.now[:error] = "Some errors occurred"
	      		render :new

	      		# shows up in URL - kevin's thing
	      		# whatever_path ({something: value})
	    	end
	    else
	    	# enter password again
	    	render :new
	    end
	end

	def edit
		@user = User.find(params[:user_id])
	end

	def update
		@user = User.find(params[:user_id])

		if @user.update_attributes(user_params)
			redirect_to user_path(@user), :notice => "Account Updated"
		else
			flash.now[:error] = "Some errors occurred"
			render :edit
		end

	end

	# Portfolios and photos are destroyed as well
	def destroy
		user = User.find(params[:user_id])

		session.delete(:user_id)
		delete_current_user()
		
		user.destroy
		redirect_to home_path
	end

	private
	def user_params
		params.require(:user).permit(:first_name, 
				:last_name, :email, :state, :about_me,
			    :personal_website, :profile_pic, :remove_profile_pic,
			    :password, :password_confirmation)
	end

end