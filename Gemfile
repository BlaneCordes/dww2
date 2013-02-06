source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


gem 'nokogiri'
gem 'ap'
gem 'awesome_print'
gem 'crack'
gem 'thin'
gem 'httparty'
gem 'devise'
gem 'omniauth'
gem 'omniauth-yahoo'
gem 'feedzirra'
gem 'newrelic_rpm'


group :development, :test do
  gem 'rspec-rails', '2.12.0'
  gem 'guard-rspec', '1.2.1'
  gem 'guard-spork', '1.2.0'
  gem 'sqlite3'
  gem 'spork', '0.9.2'
  gem 'webmock', '1.9.0'
   if RUBY_VERSION =~ /1.9/ 
   gem 'ruby-debug19' 
  else 
   gem 'ruby-debug' 
  end 
end

group :test do
  gem 'cucumber-rails' 
  gem 'database_cleaner' # database_cleaner is not required, but highly recommended
  gem 'capybara', '1.1.2'
  gem 'rb-fsevent', '0.9.1', :require => false
  gem 'growl', '1.0.3'
end 

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

