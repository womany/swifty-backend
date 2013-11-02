source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'

# Use mysql as the database for Active Record
gem 'mysql2'

gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook', '1.4.0'

gem 'will_paginate', '~> 3.0'
gem 'acts_as_commentable'
gem 'auto_html'
gem 'settingslogic'
gem 'ransack'
gem 'cells'
gem 'koala', '~> 1.8.0rc1'

# API
gem 'grape'
gem 'grape-swagger'
gem 'grape-swagger-rails'
gem 'rack-cors'

# assets
gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails', :github => 'anjlab/bootstrap-rails'
gem 'will_paginate-bootstrap'
gem 'font-awesome-rails'
gem 'compass-rails'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'xray-rails'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'wirble'
  gem 'annotate', '>=2.5.0'
  gem 'quiet_assets'
  gem 'rack-mini-profiler'
  gem 'thin'
  gem 'capistrano'
  gem 'capistrano_colors'
  gem 'rvm-capistrano'
end

group :production, :staging do
  gem 'unicorn'
end
