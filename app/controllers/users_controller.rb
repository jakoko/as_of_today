class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new()
	end

	def create
		@user = User.new(user_params)

		if @user.save
	      redirect_to user_path(@user), :notice => "Account Created"

	    else
	      flash.now[:error] = "Some errors occurred"
	      render :new
	    end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update_attributes(user_params)
			redirect_to user_path(@user), :notice => "Account Updated"
		else
			flash.now[:error] = "Some errors occurred"
			render :edit
		end

	end

	def destroy

	end


	private
	def user_params
		params.require(:user).permit(:first_name, 
				:last_name, :email, :state, :about_me,
			    :personal_website, :profile_pic, :remove_profile_pic)
	end

end

	# field :first_name
 #    field :last_name
 #    field :profile_pic

 #    field :role
 #    field :about_me
 #    field :personal_website
 #    field :email
 #    field :style