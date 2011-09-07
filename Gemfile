source 'http://rubygems.org'
gem 'rails', '3.1.0'

# Asset template engines
group :assets do
  gem 'sass-rails'
  gem 'coffee-script'
  gem 'uglifier'
end

#gem 'resque', :require => "resque/server"
gem 'cancan'
gem 'ystock'

gem 'jquery-rails'
gem 'carrierwave'

gem 'haml'
gem 'ransack'
gem 'thin'  # added for heroku
gem 'kaminari'

group :development do
  gem 'taps'
  gem 'heroku'
  gem 'eventmachine'
  gem 'foreman'
end

group :production do
  gem 'therubyracer-heroku'
  gem 'pg'
  gem 'arel'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  #gem 'rspec'
  gem 'webrat'
  gem 'factory_girl_rails'
end

group :development, :test do
  #gem 'rspec-rails'
  gem 'sqlite3'
end
