class PortfoliosController < ApplicationController
	def index
		@portfolios = Portfolio.all
	end

	# Eventually, show thumbnail cover of each portfolio
	def show_user_portfolios
		@portfolios = Portfolio.where(user_id: params[:user_id])
		@user = User.find(params[:user_id])
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
			logger.debug 'photo_params'
		logger.debug photo_params
		photo_params[:photo_image].each { |p| @portfolio.photos.new(photo_image: p) }

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
		# @user = User.find(params[:user_id])
		logger.debug "in create"
		logger.debug "params of photos_attributes"
		logger.debug params[:portfolio][:photos_attributes]
		logger.debug 'photo_params'
		logger.debug photo_params
		@portfolio = Portfolio.find(params[:id])

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
		# logger.debug("in port_params")
		params.require(:portfolio).permit(:title, :user_id, :venue, :description, :date)
	end

	def photo_params
		# logger.debug("in photo_params")
		params.require(:portfolio).require(:photos_attributes).permit(photo_image: [])
	end
end



		# logger.debug 'photo_params'
		# logger.debug photo_params
		# logger.debug portfolio_params[:photos_attributes]
		# @dude = portfolio_params

		# logger.debug "in create"
		# logger.debug @dude
		# logger.debug @dude.photos_attributes
		# logger.debug("before array")
		# logger.debug photo_params[:photo_image].class
