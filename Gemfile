source 'http://rubygems.org'
gem 'rails', '3.1.1'
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

group :development do
  gem 'taps'
  gem 'heroku'
  gem 'eventmachine', '~> 1.0.0.beta.4.1'
  gem 'foreman'
end

group :production do
  gem 'therubyracer-heroku'
  gem 'pg'
  gem 'arel'
end

group :test do
  #gem 'rspec'
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
