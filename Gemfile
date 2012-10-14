source 'http://rubygems.org'
gem 'rails', '3.2.8'
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
gem 'clockwork'
gem 'god'
gem 'nested_form'#, :git => 'https://github.com/ryanb/nested_form.git'
gem 'globalize3'
gem 'httparty'
gem 'mysql2'
gem 'daemons'
gem 'unicorn'
gem 'feedzirra', '0.2.0.rc2'

  
group :production do
 #gem 'pg'
 #gem 'therubyracer-heroku'
end


group :development do
  gem 'taps'
  gem 'foreman'
  gem 'therubyracer'
	gem 'capistrano-unicorn', :require => false
end

group :test do
  gem 'webrat'
  gem 'factory_girl_rails'
end

group :development, :test do
  gem 'rb-fsevent'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'guard'
  gem 'guard-rspec'
  gem 'sqlite3'
end
