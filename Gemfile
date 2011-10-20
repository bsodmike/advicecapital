source 'http://rubygems.org'
gem 'rails', '3.1.0'
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

gem 'haml'
gem 'ransack'
gem 'thin'  # added for heroku
gem 'kaminari'
gem 'panda'
gem 'googlecharts'

gem 'capistrano'

group :development do
  gem 'taps'
  gem 'heroku'
  gem 'foreman'
  gem 'eventmachine'
  gem 'therubyracer'
end

group :production do
  gem 'therubyracer-heroku'
  gem 'pg'
  gem 'arel'
end

group :test do
  gem 'webrat'
  gem 'factory_girl_rails'
end

group :development, :test do
  gem 'turn'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'guard'
  gem 'guard-rspec'
  gem 'minitest'
  gem 'sqlite3'
end
