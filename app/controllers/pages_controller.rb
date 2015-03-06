class PagesController < ApplicationController
   layout "landing_page", only: [:landing]

  def landing
    
  end

  def home
  	@photos = Photo.all
  end
end