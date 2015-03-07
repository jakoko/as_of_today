class PortfoliosController < ApplicationController

	before_action :authorized?, only: [:new, :edit, :destroy]
	before_action :authorized_portfolio_actions?, only: [:create, :update]

	def index
		@portfolios = Portfolio.all
	end

	# Show all of user's portfolios
	def show_user_portfolios
		me? ? @user = current_user : @user = User.find(params[:user_id])

		@portfolios = Portfolio.where(user_id: params[:user_id])
	end

	# Show contents of an individual portfolio
	def show
		me? ? @user = current_user : @user = User.find(params[:user_id])

		@portfolio = Portfolio.find(params[:id])
		@photos = Photo.where(portfolio_id: params[:id])
	end

	def new
		@user = current_user
		@portfolio = Portfolio.new()
	end

	def create
		@portfolio = Portfolio.new(portfolio_params)

		unless photo_params.empty? 
			photo_params[:photo_image].each { |p| @portfolio.photos.new(photo_image: p) }
		else
			flash.now[:error] = "Please include at least one photo"
			render :new and return
		end

		if @portfolio.save 
			redirect_to portfolio_path(@portfolio.user_id, @portfolio)
		else
			render :new
		end
	end

	def edit_portfolios
		@portfolios = Portfolio.where(user_id: current_user)
	end

	def edit
		me? ? @user = current_user : @user = User.find(params[:user_id])

		@portfolio = Portfolio.find(params[:id])
		@photos = Photo.where(portfolio_id: params[:id])
	end

	def update
		portfolio = Portfolio.find(params[:id])

		# Upload image
		unless photo_params[:photo_image].nil? 
			photo_params[:photo_image].each do |p| 
				portfolio.photos.new(photo_image: p) 
			end
		end

		# Remove images
		unless photo_params[:current_photo].nil?
			photo_params[:current_photo].each { |key, value|
				Photo.find(value[:photo_id]).delete if value[:remove_photo_image] == "1"
			}
		end

		# Update
		if portfolio.update_attributes(portfolio_params)
			redirect_to edit_portfolios_page_path(portfolio.user_id, portfolio)
		else
			flash[:error] = "There was an error"
			redirect_to edit_portfolio_path(portfolio.user_id, portfolio)
		end
	end

	def destroy
		user = current_user
		portfolios = Portfolio.find(params[:id])
		portfolios.destroy
		
		redirect_to user_portfolios_path(user)
	end

	private
	def portfolio_params
		params.require(:portfolio).permit(:title, :user_id, :venue, :description, :date)
	end

	def photo_params
		# .fetch is used since :photos_attributes may not always exist.
		# return {} if :photos_attributes does not exist
		params.require(:portfolio).fetch(:photos_attributes, {}).permit(current_photo: [:remove_photo_image, :photo_id], photo_image: [])
	end
end