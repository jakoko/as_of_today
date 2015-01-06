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
	end

	def new
		@user = User.find(params[:user_id])
		@portfolio = Portfolio.new()
	end

	def create
		@portfolio = Portfolio.new(portfolio_params)

		if @portfolio.save
			redirect_to portfolio_path(@portfolio.user_id ,@portfolio)
		else
			redirect_to new_portfolio_path
		end
	end

	def edit
		@user = User.find(params[:user_id])
		@portfolio = Portfolio.find(params[:id])
	end

	def update

	end

	def destroy

	end

	private
	def portfolio_params
		params.require(:portfolio).permit(:title, :user_id, 
						:venue, :description, :date)
	end
end
