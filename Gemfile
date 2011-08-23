source 'http://rubygems.org'
gem 'rails', '3.1.0.rc6'

# Asset template engines
group :assets do
  gem 'sass-rails', "~> 3.1.0.rc"
  gem 'coffee-script'
  gem 'uglifier'
end


gem 'jquery-rails'

gem 'carrierwave'

gem 'haml'
gem 'meta_search'
gem 'bcrypt-ruby', :require => 'bcrypt'

group :development do
  gem 'thin'
  gem 'eventmachine', '1.0.0.beta.3'
end

group :production do
  gem 'therubyracer-heroku'
  gem 'pg'
end

group :development do
  gem 'thin'
  gem 'eventmachine', '1.0.0.beta.3'
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
