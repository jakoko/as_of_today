class PortfoliosController < ApplicationController
	def index
		@portfolios = Portfolio.all
	end

	# Eventually, show thumbnail cover of each portfolio
	def show_user_portfolios
		# if logged_in? && params[:user_id] == session[:user_id]
			@portfolios = Portfolio.where(user_id: params[:user_id])
			@user = User.find(params[:user_id])
		# else
			# redirect_to home_path
			# send error
		# end
	end

	# Show individual pictures of within a single(chosen) portfolio
	def show
		@user = User.find(params[:user_id])
		@portfolio = Portfolio.find(params[:id])
		@photos = Photo.where(portfolio_id: params[:id])
	end

	def new
		@user = User.find(params[:user_id])
		@portfolio = Portfolio.new()
	end

	def create
		@portfolio = Portfolio.new(portfolio_params)

		unless photo_params.empty? 
			photo_params[:photo_image].each { |p| @portfolio.photos.new(photo_image: p) }
		end

		if @portfolio.save 
			redirect_to portfolio_path(@portfolio.user_id, @portfolio)
		else
			render :new
		end
	end

	def edit
		@user = User.find(params[:user_id])
		@portfolio = Portfolio.find(params[:id])
		@photos = Photo.where(portfolio_id: params[:id])
	end

	def update
		@portfolio = Portfolio.find(params[:id])

		# Upload image
		unless photo_params[:photo_image].nil? 
			photo_params[:photo_image].each { |p| 
				@portfolio.photos.new(photo_image: p) 
				logger.debug "here"
			}
		end

		# Remove images
		unless photo_params[:current_photo].nil?
			photo_params[:current_photo].each { |key, value|
				logger.debug Photo.find(value[:photo_id]).delete if value[:remove_photo_image] == "1"
			}
		end

		# Update
		if @portfolio.update_attributes(portfolio_params)
			redirect_to portfolio_path(@portfolio.user_id, @portfolio)
		else
			render :edit
		end
	end

	def destroy
		user = User.find(params[:user_id])
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



















