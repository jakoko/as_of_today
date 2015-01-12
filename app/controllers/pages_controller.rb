class PagesController < ApplicationController
  def home
  	# don't forget to randomize
  	@photos = Photo.all
  end
end
