source 'http://rubygems.org'

gem 'rails', '3.1.0.rc4'

# Asset template engines
gem 'sass'
gem 'coffee-script'
gem 'uglifier'
gem 'sprockets'
gem 'sprockets', "2.0.0.beta.10"

gem 'jquery-rails'

gem 'carrierwave'
gem 'haml'
gem 'meta_search'
gem 'bcrypt-ruby', :require => 'bcrypt'

group :production do
  gem 'therubyracer-heroku'
  gem 'pg'
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
  gem 'annotate-models'
  gem 'sqlite3'
end
