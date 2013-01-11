source 'http://rubygems.org'
gem 'rails', '3.2.11'
gem 'bcrypt-ruby'

# Asset template engines
group :assets do
  gem 'sass-rails'
  gem 'coffee-script'
  gem 'uglifier'
end

gem 'resque', :require => "resque/server"
gem 'cancan'
gem 'ystock'
gem 'jquery-rails'
gem 'carrierwave'
#gem 'rmagick'
gem 'devise'
gem 'haml'
gem 'ransack'
gem 'kaminari'
gem 'panda'
gem 'fog'
gem 'prawn'
gem 'capistrano'
gem 'rest-open-uri'
gem 'globalize3'
gem 'httparty'
gem 'unicorn'
gem 'feedzirra', '0.2.0.rc2'
gem 'whenever', :require => false
gem 'turbolinks'
  
group :production do
  gem 'mysql2'
end


group :development do
	gem 'better_errors'
  gem 'taps'
  gem 'foreman'
  gem 'therubyracer', '0.11.0beta8'
	gem 'capistrano-unicorn', :require => false
end

group :test do
  gem 'webrat'
  gem 'factory_girl_rails'
	gem 'capybara'
	gem 'guard-rspec'
end

group :development, :test do
  gem 'rb-fsevent'
  gem 'rspec-rails'
  gem 'guard'
  gem 'sqlite3'
end
