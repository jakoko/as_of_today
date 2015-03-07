class UsersController < ApplicationController

	before_action :authorized?, only: [:edit, :update, :destroy]
	before_action :users_controller_banned_actions, only: [:new, :create]

	def index
		@users = User.all
	end

	def show
		# Prevent hitting database if user is visiting own page
		me? ? @user = current_user : @user = User.find(params[:user_id])
	end

	def new
		@user = User.new()
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id.to_s
   		redirect_to user_path(@user), :notice => "Account Created"
   	else
   		render :new
   	end
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user

		if @user.update_attributes(user_params)
			redirect_to user_path(@user), :notice => "Account Updated"
		else
			flash[:error] = "Some errors occurred"
			redirect_to edit_user_path(@user)
		end
	end

	def user_account

	end

	# Portfolios and photos are destroyed as well
	def destroy
		user = current_user

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