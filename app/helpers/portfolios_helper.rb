module PortfoliosHelper

  def portfolio_cover_image(portfolio)
    return portfolio.photos.first.photo_image.url(:thumb) unless portfolio.photos.first.nil?
    return image_url('no_image.jpeg')
  end

end