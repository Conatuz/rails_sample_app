source 'https://rubygems.org'

gem 'rails', '3.2.13'
# Bootstrap CSS styling
gem 'bootstrap-sass', '2.1'
# password encryption
gem 'bcrypt-ruby', '3.0.1'
# faker to add sample users
gem 'faker', '1.0.1'
# Pagination
gem 'will_paginate', '3.0.3'
# Use with bootstrap
gem 'bootstrap-will_paginate', '0.0.6'

# Switch to Postgre
#gem 'pg', '0.12.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# set up development database, rspec
group :development, :test do
  gem 'sqlite3', '1.3.5'
  gem 'rspec-rails', '2.11.0'
  gem 'guard-rspec', '1.2.1'
  
  # spork
  gem 'guard-spork', '1.2.0'
  gem 'childprocess', '0.3.6'
  gem 'spork', '0.9.2'
end

group :development do
  gem 'annotate', '2.5.0'
end



# Gems used only for assets and not required
# in production environments by default.
# use set versions
group :assets do
  gem 'sass-rails',   '3.2.5'
  gem 'coffee-rails', '3.2.2'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '1.2.3'
end

gem 'jquery-rails', '2.0.2'

# testing, allows us to simulate user's interaction
group :test do
  gem 'capybara', '1.1.2'
  gem 'rb-fchange', '0.0.5'
  gem 'rb-notifu', '0.0.4'
  gem 'win32console', '1.3.2'
  gem 'wdm', '0.1.0'
  gem 'factory_girl_rails', '4.1.0'
  
  # cucumber
  gem 'cucumber-rails', '1.2.1', :require => false
  gem 'database_cleaner', '0.7.0'
end

# production database
group :production do
  gem 'pg', '0.12.2'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
