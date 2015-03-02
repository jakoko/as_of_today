source 'https://rubygems.org'

###################
# Added Gems
###################
ruby '2.1.3'

# Using mongoid to link Rails with MongoDB
gem 'mongoid', '~> 4.0.0'

# Bootstrap gem
gem 'bootstrap-sass', '~>3.2.0'

# Load javascript for specific pages
gem 'loadjs'

# For password hashing
gem 'bcrypt', '~>3.1.9'

# Processing and save images in background
gem 'sidekiq'

# Using carrierwave for file uploads
gem 'carrierwave'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'

# To process images before file upload
gem "mini_magick"

# Secure Rails configuration (to git)
gem 'figaro'

# Amazon S3 service
gem 'fog'

# Heroku to use assets
gem 'rails_12factor', group: :production

# Use thin server
gem 'thin', group: :production

# Development purposes
group :development do
	gem "better_errors"
	gem 'quiet_assets'
end

###################
# RAILS GEMS
###################
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.7'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]