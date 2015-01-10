class PhotosController < ApplicationController
	def index
		@photos = Photo.all
	end

	def new
	end

	def create

	end
end