class PhotosController < ApplicationController
	def show
		@photo = Photo.find(params[:photo_id])
		@portfolio = Portfolio.where(id: @photo.portfolio_id).first
		@user = User.where(id: @portfolio.user_id).first
	end
end