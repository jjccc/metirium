source 'http://rubygems.org'

gem "rails", "3.1.0"

group :production do
  gem "mysql2"
  gem "execjs" 
  gem "therubyracer" 
end

group :development do
  #gem "pg"  
end

gem "rake", "0.8.7"
gem "ValidateEmail", "~> 1.0.0"
gem "gon"
gem "mustache", "~> 0.99.4"
gem "devise"
gem "kaminari"
gem "bootstrap-kaminari-views"
gem "js-routes", "0.7.5"


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem "sass-rails", "~> 3.1.0"
  gem "coffee-rails", "~> 3.1.0"
  gem "uglifier"
end

gem "jquery-rails"

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem "turn", :require => false
end
